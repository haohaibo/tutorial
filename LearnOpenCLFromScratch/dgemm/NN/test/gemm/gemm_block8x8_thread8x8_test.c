/*
 * Author: Haibo Hao
 * Email : haohaibo@ncic.ac.cn
 * Desc  : General Matrix Matrix Multiply 
 * Copyright (C) 2017 NCIC
 **/

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <memory.h>
#include <math.h>
#include <CL/cl.h>
#include "err_code.h"
#include "wtime.h"

//#ifdef _OPENMP
//#include <omp.h>
//#else
//#include <sys/time.h>
//#endif
//
//double wtime(){
//#ifdef _OPENMP
//    /* Use omp_get_wtime() if we can*/
//    return omp_get_wtime();
//#else
//    static int sec = -1;
//    struct timeval tv;
//    gettimeofday(&tv, NULL);
//    if(sec < 0){
//        sec = tv.tv_sec;
//    }
//    return (tv.tv_sec - sec) + 1.0e-6*tv.tv_usec;
//#endif
//}

#ifndef DEVICE
#define DEVICE CL_DEVICE_TYPE_DEFAULT
#endif

//#define TOL (0.001)    // tolerence used in floating point comparisons
#define TOL (0.001)    // tolerence used in floating point comparisons
//#define TOL (2.0)    // tolerence used in floating point comparisons
#define LENGTH (1024)  // length of vector c, a and b

// Size of the matrices - M, N, K(squared)
#define SIZE 1024 

// Number of repeated times
#define NUM_RUNS 5

// Threadblock Sizes
#define TS 16 

//const char *vadd_kernel_source = 
//"\n"\
//        "__kernel void vadd(                           \n"\
//        " __global float* a,                           \n"\
//        " __global float* b,                           \n"\
//        " __global float* c,                           \n"\
//            " const unsigned int count                     \n"\
//            " )                                            \n"\
//            "{                                             \n"\
//            "  int i = get_global_id(0);                   \n"\
//            "  if(i < count)                               \n"\
//            "      c[i] = a[i] + b[i];                     \n"\
//            "}                                             \n"\
//            "\n";
const char *MatMult_kernel_source = 
"\n"
"__kernel void MatMul(\n"
" const __global float* A,\n"
" const __global float* B,\n" 
" __global float* C,\n"
" const int M,\n"
" const int N,\n"
" const int K\n"
" )\n"
"{\n"
"  // Thread identifiers\n"
"  const int row = get_local_id(0); // Local row ID (max: TS)\n"
"  const int col = get_local_id(1); // Local col ID (max: TS)\n"
"  const int TS = 16;\n"
"  const int globalRow = get_group_id(0)*TS + row; // Row ID of C (0..M)\n"
"  const int globalCol = get_group_id(1)*TS + col; // Col ID of C (0..N)\n"
"  // Local memory to fit a tile of A and B\n"
"  __local float Asub[TS][TS];\n"
"  __local float Bsub[TS][TS];\n"
"  // Loop over all tiles\n"
"  const int numTiles = K/TS;\n"
"  // Initialize accumulation register\n"
"  float acc = 0.0f;\n"
"    for (int t=0; t<numTiles; t++) {\n"
"        // Load one tile of A and B into local memory\n"
"        const int tiledRow = t*TS + row;\n"
"        const int tiledCol = t*TS + col;\n"
"        Asub[col][row] = A[tiledCol*M + globalRow];\n"
"        Bsub[col][row] = B[globalCol*K + tiledRow];\n"
"        // Synchronise to make sure the tile is loaded\n"
"        barrier(CLK_LOCAL_MEM_FENCE);\n"
"        // Perform the computation for a single tile\n"
"        for (int k=0; k<TS; k++) {\n"
"            acc += Asub[k][row] * Bsub[col][k];\n"
"        }\n"
"        // Synchronise before loading the next tile\n"
"        barrier(CLK_LOCAL_MEM_FENCE);\n"
"    }\n"
"  C[globalCol*M + globalRow] = acc;\n"
"}\n";

char * getKernelSource(char *filename, int *length);

char * getKernelSource(char *filename, int *length){
    FILE *file = fopen(filename, "r");
    if(!file){
        fprintf(stderr,
                "Error, Could not open kernel source file\n");
        exit(EXIT_FAILURE);
    }
    // pointer: seek to the end of the file
    fseek(file, 0, SEEK_END);
    int len = ftell(file) + 1;
    *length = len;
    // pointer: rewind to the begin of the file
    rewind(file);

    char* source = (char*)calloc(sizeof(char), len);
    if(!source){
        fprintf(stderr,
                "Error, Could not allocate memory for source string\n");
        exit(EXIT_FAILURE);
    }

    fread(source, sizeof(char), len, file);
    fclose(file);
    return source;
}

int main(int argc, char* argv[]){
    //printf("%s\n",MatMult_kernel_source);

    int err;   // error code returned from OpenCL calls
    unsigned int correct; // number of correct results
    // Set the sizes
    //int M = SIZE;
    //int N = SIZE;
    //int K = SIZE;
    int M = atoi(argv[1]);
    int N = atoi(argv[2]);
    int K = atoi(argv[3]);;
    float*    h_a = malloc(M*K*sizeof(float));  // host matrix a
    float*    h_b = malloc(K*N*sizeof(float));  // host matrix b
    float*    h_c = malloc(M*N*sizeof(float));  // host matrix c


    // device
    cl_device_id     device_id; // compute device id
    cl_context       context;   // compute context
    cl_command_queue command_queue;  // compute command queue
    cl_program       program;   // compute program
    cl_kernel        ko_MatMul;   // compute kernel

    cl_mem           d_a;       // device matrix a
    cl_mem           d_b;       // device matrix b 
    cl_mem           d_c;       // device matrix c 

    // Fill matrix a and b with random float values
    int i = 0;
    for(i = 0; i < M*K; ++i){
        h_a[i] = rand() / (float)RAND_MAX;
        //h_a[i] = 3.0;
        //h_a[i] = 3.6*i + i*i + 3.1;
        //printf("%f ",h_a[i]);
    }
    //printf("\n");
    for(i = 0; i < N*K; ++i){
        h_b[i] = rand() / (float)RAND_MAX;
        //h_b[i] = 5.0;
        //h_b[i] = 1.2*i + 0.01*i*i + 13.9;
        //printf("%f ",h_b[i]);
    }
    //printf("\n");

    // Configure the OpenCL environment

    // set up platform and GPU device
    cl_uint num_platforms;

    // get number of platforms
    err = clGetPlatformIDs(
            0,
            NULL,
            &num_platforms);
    checkError(err, "Finding platforms");

    if(num_platforms == 0){
        printf("Found 0 platforms\n");
        return EXIT_FAILURE;
    }

    // get all platforms
    cl_platform_id platform[num_platforms];
    err = clGetPlatformIDs(
            num_platforms,
            platform,
            NULL);
    checkError(err, "Getting platforms's IDs");

    // get a GPU
    for( i = 0; i < num_platforms; ++i){
        err = clGetDeviceIDs(
                platform[i],
                DEVICE,
                1,
                &device_id,
                NULL); 

        if(err == CL_SUCCESS){
            break;
        }
    }

    if(device_id == NULL){
        printf("No devices found\n");
    }


#if 0 
    cl_context clCreateContext(
            const cl_context_properties *properties,
            cl_uint num_devices,
            const cl_device_id *devices,
            void ( CL_CALLBACK  *pfn_notify) (
                const char *errinfo,
                const void *private_info, size_t cb,
                void *user_data
                ),
            void *user_data,
            cl_int *errcode_ret)
#endif
        // create a compute context
        context = clCreateContext(
                0,
                1,
                &device_id,
                NULL,
                NULL,
                &err);
    checkError(err, "Creating context");
#if 0
    cl_command_queue clCreateCommandQueue(
            cl_context context,
            cl_device_id device,
            cl_command_queue_properties properties,
            cl_int *errcode_ret)
#endif

        // create a command queue(bind to a device)
        command_queue = clCreateCommandQueue(
                context,
                device_id,
                0,
                &err);
    checkError(err, "Creating command queue");
#if 0
    cl_program clCreateProgramWithSource (
            cl_context context,
            cl_uint count,
            const char **strings,
            const size_t *lengths,
            cl_int *errcode_ret)
#endif

        // get kernel source
        //char * gemm_kernel = getKernelSource("gemm_block8x8_thread8x8_ffma_bench.cl");
        //char * gemm_kernel = getKernelSource("gemm_block8x8_thread8x8_private_preG_test2.cl");
        //char * gemm_kernel = getKernelSource("gemm_block8x8_thread8x8_private_preG_preS.cl");
        //char * gemm_kernel_file = "gemm_block8x8_thread8x8_private_manual_unroll.cl";
        //char * gemm_kernel_file = "gemm_block8x8_thread8x8_private_manual_unroll_preG.cl";
        //char * gemm_kernel_file = "gemm_block8x8_thread8x8_private_manual_unroll_preG_noif.cl";
        //char * gemm_kernel_file = "gemm_block8x8_thread8x8_private_manual_unroll_preG_noif_v2.cl";
        //char * gemm_kernel_file = "gemm_block8x8_thread8x8_private_manual_unroll_preG_noif_512unroll.cl";
        //char * gemm_kernel_file = "gemm_block8x8_thread8x8_private_manual_unroll_preG_noif_512unroll_nobank.cl";
        //char * gemm_kernel_file = "gemm_block8x8_thread8x8_private_manual_unroll_preG_noif_512unroll_nobank_test.cl";
        char * gemm_kernel_file = "gemm.co";
    //printf("gemm kernel file: %s\n",gemm_kernel_file);
    //char * gemm_kernel = getKernelSource(gemm_kernel);
    //char * gemm_kernel = getKernelSource("gemm_block8x8_thread8x8_private_manual_unroll.cl");
    int length;
    char * gemm_kernel = getKernelSource(gemm_kernel_file, &length);
    //char * gemm_kernel = getKernelSource("gemm_block8x8_thread8x8_private_preG.cl");
    //char * gemm_kernel = getKernelSource("gemm_block8x8_thread8x8_nobank.cl");
    //char * gemm_kernel = getKernelSource("gemm_block8x8_thread8x8_private_preG_nobank.cl");
    //fprintf(stdout,"%s\n",gemm_kernel);
    // create the compute program from the source buffer
#if 0
    cl_program clCreateProgramWithBinary (  cl_context context,
            cl_uint num_devices,
            const cl_device_id *device_list,
            const size_t *lengths,
            const unsigned char **binaries,
            cl_int *binary_status,
            cl_int *errcode_ret)
#endif

        program = clCreateProgramWithBinary (
                context,
                1,
                &device_id,
                (const size_t *)&length,
                (const unsigned char **)&gemm_kernel,
                NULL,
                &err);
#if 0
    cl_program clCreateProgramWithSource (  cl_context context,
            cl_uint count,
            const char **strings,
            const size_t *lengths,
            cl_int *errcode_ret)

#endif
#if 0
        program = clCreateProgramWithSource(
                context,
                1,
                //(const char **)&MatMult_kernel_source,
                (const char **)&gemm_kernel,
                NULL, // null-terminated
                &err);
#endif
    checkError(err, "Creating program from source");

#if 0
    cl_int clBuildProgram (
            cl_program program,
            cl_uint num_devices,
            const cl_device_id *device_list,
            const char *options,
            void (*pfn_notify)(cl_program, void *user_data),
            void *user_data)
#endif
        // build the program
        err =  clBuildProgram(
                program,
                0,
                NULL,
                NULL,
                NULL,
                NULL);
    checkError(err, "Build program");

#if 0
    cl_kernel clCreateKernel (
            cl_program  program,
            const char *kernel_name,
            cl_int *errcode_ret)
#endif
        // create the compute kernel object from the program
        ko_MatMul = clCreateKernel( 
                program,
                //"MatMul",
                "gemm",
                &err);
    checkError(err, "Creating kernel");

#if 0
    //Creates a buffer object.
    cl_mem clCreateBuffer (
            cl_context context,
            cl_mem_flags flags,
            size_t size,
            void *host_ptr,
            cl_int *errcode_ret)
#endif

        // malloc device buffer
        // create the input (a,b) and output (c) arrays
        // in device
        d_a = clCreateBuffer(
                context,
                CL_MEM_READ_ONLY,
                sizeof(float)*M*K,
                NULL,
                &err);
    checkError(err, "Creating buffer d_a");
    d_b = clCreateBuffer(
            context,
            CL_MEM_READ_ONLY,
            sizeof(float)*K*N,
            NULL,
            &err);
    checkError(err, "Creating buffer d_b");
    d_c = clCreateBuffer(
            context,
            CL_MEM_READ_WRITE,
            sizeof(float)*M*N,
            NULL,
            &err);
    checkError(err, "Creating buffer d_c");
#if 0
    cl_int clEnqueueWriteBuffer(
            cl_command_queue command_queue,
            cl_mem buffer,
            cl_bool blocking_write,
            size_t offset,
            size_t size,
            const void *ptr,
            cl_uint num_events_in_wait_list,
            const cl_event *event_wait_list,
            cl_event *event)
#endif

        // copy from host to device
        // write from host to device memory
        err = clEnqueueWriteBuffer(
                command_queue,
                d_a,
                CL_TRUE,
                0,
                sizeof(float)*M*K,
                h_a,
                0,
                NULL,
                NULL);
    checkError(err, "Copying h_a to d_a");

    err = clEnqueueWriteBuffer(
            command_queue,
            d_b,
            CL_TRUE,
            0,
            sizeof(float)*K*N,
            h_b,
            0,
            NULL,
            NULL);
    checkError(err, "Copying h_b to d_b");
#if 0
    cl_int clSetKernelArg(
            cl_kernel kernel,
            cl_uint arg_index,
            size_t arg_size,
            const void *arg_value)
#endif
        // set the arguments to our compute kernel
        err = clSetKernelArg(
                ko_MatMul,
                0,
                sizeof(cl_mem),
                &d_a);
    err |= clSetKernelArg(
            ko_MatMul,
            1,
            sizeof(cl_mem),
            &d_b);
    err |= clSetKernelArg(
            ko_MatMul,
            2,
            sizeof(cl_mem),
            &d_c);
    err |= clSetKernelArg(
            ko_MatMul,
            3,
            sizeof(int),
            &M);
    err |= clSetKernelArg(
            ko_MatMul,
            4,
            sizeof(int),
            &N);
    err |= clSetKernelArg(
            ko_MatMul,
            5,
            sizeof(int),
            &K);
    checkError(err, "Setting kernel arguments");

#if 0
    cl_int
        clEnqueueNDRangeKernel(
                cl_command_queue command_queue,
                cl_kernel kernel,
                cl_uint work_dim,
                const size_t *global_work_offset,
                const size_t *global_work_size,
                const size_t *local_work_size,
                cl_uint num_events_in_wait_list,
                const cl_event *event_wait_list,
                cl_event *event)
#endif
        // execute the kernel
        // letting the OpenCL runtime choose the work-group size
        const size_t global[2] = {M/8, N/8};
    const size_t local[2] = {8, 8};
    //const size_t local[2] = {TS, TS};
    //const size_t local[2] = {32, 32}; // error: can not exceed 256 work-items
    //printf("Starting my SGEMM M = %d N = %d K = %d "
    //        "running...(repeated %d times)\n",
    //        M,N,K,NUM_RUNS);
    printf("%d\t\t", M);
    double rtime = wtime();
    for(int i = 0; i < NUM_RUNS; ++i){
        err = clEnqueueNDRangeKernel(
                command_queue,
                ko_MatMul,
                2,
                NULL,
                global,
                local,
                0,
                NULL,
                NULL);
#if 0
        cl_int clFinish(
                cl_command_queue command_queue);
#endif
        // wait for the commands to complete before
        err = clFinish(command_queue);
    }
    //checkError(err, "Enqueuing kernel");

    // stopping the timer
    rtime = (wtime() - rtime)/(double)NUM_RUNS;
    checkError(err, "Waiting for kernel to finish");
    double gflops = ((long)M*(long)N*(long)K*2*1.0)/(double)(1000*1000*1000);
    //printf("\nThe kernel ran in %lf seconds\n", rtime);
    printf("%.1lf GFLOPS",gflops/rtime);

#if 0 
    cl_int clEnqueueReadBuffer(
            cl_command_queue command_queue,
            cl_mem buffer,
            cl_bool blocking_read,
            size_t offset,
            size_t size,
            void *ptr,
            cl_uint num_events_in_wait_list,
            const cl_event *event_wait_list,
            cl_event *event)
#endif
        // read back the resuls from device to host
        err = clEnqueueReadBuffer(
                command_queue,
                d_c,
                CL_TRUE,
                0,
                sizeof(float)*M*N,
                h_c,
                0,
                NULL,
                NULL);
    checkError(err, "Copying d_c to h_c");
    if(err != CL_SUCCESS){
        printf("Error: Failed to read output array\n");
    }

    //for(int i = 0; i < M*N; ++i){
    //    printf("%f ",h_c[i]);
    //}
    printf("\n");
    // Test the results
    correct = 0;
    float temp = 0;
#if 1 
    printf("Verifing the GPU result...\n");
    for(int i = 0; i < M; ++i)
    {
        for(int j = 0; j < N; ++j){
            temp = 0;
            for(int k = 0; k < K; ++k){
                temp += h_a[k*M + i]*h_b[j*K + k]; 
            }
            //printf("%f ",temp);
            temp -= h_c[j*M + i];
            //printf("quare err %f\n",temp*temp);
            if(temp*temp < TOL*TOL){
                ++correct;
            }else{
                printf("temp %f h_c %f\n",
                        temp,h_c[i]);
            }
        }
    }

    // sum results
    printf("C = A * B: %d out of %d results were correct.\n", correct, M*N);
#endif
    // Free the OpenCL memory objects
    clReleaseMemObject(d_a);
    clReleaseMemObject(d_b);
    clReleaseMemObject(d_c);

    // Clean up OpenCL environment
    clReleaseContext(context);
    clReleaseCommandQueue(command_queue);
    clReleaseProgram(program);
    clReleaseKernel(ko_MatMul);


    // Free host memory objects
    free(h_a);
    free(h_b);
    free(h_c);

    return 0;
}
