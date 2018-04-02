/*
 * Author: Haibo Hao
 * Email : haohaibo@ncic.ac.cn
 * Desc  : Elementwise addtion of two vectors(c = a + b)
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

#define TOL (0.001)    // tolerence used in floating point comparisons
#define LENGTH (1024)  // length of vector c, a and b

const char *vadd_kernel_source = 
"\n"\
        "__kernel void vadd(                           \n"\
        " __global float* a,                           \n"\
        " __global float* b,                           \n"\ 
        " __global float* c,                           \n"\
            " const unsigned int count                     \n"\
            " )                                            \n"\
            "{                                             \n"\
            "  int i = get_global_id(0);                   \n"\
            "  if(i < count)                               \n"\
            "      c[i] = a[i] + b[i];                     \n"\
            "}                                             \n"\
            "\n";

int main(int argc, char* argv[]){
    //printf("%s\n",vadd_kernel_source);

    int err;   // error code returned from OpenCL calls
    unsigned int correct; // number of correct results
    float*    h_a = malloc(LENGTH*sizeof(float));  // host vector a
    float*    h_b = malloc(LENGTH*sizeof(float));  // host vector b
    float*    h_c = malloc(LENGTH*sizeof(float));  // host vector c

    size_t global;  // global domain size

    // device
    cl_device_id     device_id; // compute device id
    cl_context       context;   // compute context
    cl_command_queue command_queue;  // compute command queue
    cl_program       program;   // compute program
    cl_kernel        ko_vadd;   // compute kernel

    cl_mem           d_a;       // device vector a
    cl_mem           d_b;       // device vector b 
    cl_mem           d_c;       // device vector c 

    // Fill vectors a and b with random float values
    int i = 0;
    int count = LENGTH;
    for(i = 0; i < count; ++i){
        h_a[i] = rand() / (float)RAND_MAX;
        h_b[i] = rand() / (float)RAND_MAX;
    }

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
        // create the compute program from the source buffer
        program = clCreateProgramWithSource(
                context,
                1,
                (const char **)&vadd_kernel_source,
                NULL, // null-terminated
                &err);
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
        ko_vadd = clCreateKernel( 
                program,
                "vadd",
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
                sizeof(float)*count,
                NULL,
                &err);
    checkError(err, "Creating buffer d_a");
    d_b = clCreateBuffer(
            context,
            CL_MEM_READ_ONLY,
            sizeof(float)*count,
            NULL,
            &err);
    checkError(err, "Creating buffer d_b");
    d_c = clCreateBuffer(
            context,
            CL_MEM_READ_WRITE,
            sizeof(float)*count,
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
                sizeof(float)*count,
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
            sizeof(float)*count,
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
                ko_vadd,
                0,
                sizeof(cl_mem),
                &d_a);
    err |= clSetKernelArg(
            ko_vadd,
            1,
            sizeof(cl_mem),
            &d_b);
    err |= clSetKernelArg(
            ko_vadd,
            2,
            sizeof(cl_mem),
            &d_c);
    err |= clSetKernelArg(
            ko_vadd,
            3,
            sizeof(unsigned int),
            &count);
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
        global = count;
    double rtime = wtime();
    err = clEnqueueNDRangeKernel(
            command_queue,
            ko_vadd,
            1,
            NULL,
            &global,
            NULL,
            0,
            NULL,
            NULL);
    checkError(err, "Enqueuing kernel");

#if 0
    cl_int clFinish(
            cl_command_queue command_queue);
#endif
    // wait for the commands to complete before
    // stopping the timer
    err = clFinish(command_queue);
    rtime = wtime() - rtime;
    checkError(err, "Waiting for kernel to finish");
    printf("\nThe kernel ran in %lf seconds\n", rtime);

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
                sizeof(float)*count,
                h_c,
                0,
                NULL,
                NULL);
    checkError(err, "Copying d_c to h_c");
    if(err != CL_SUCCESS){
        printf("Error: Failed to read output array\n");
    }

    // Test the results
    correct = 0;
    float temp = 0;
    for(int i = 0; i < count; ++i)
    {
        temp = h_a[i] + h_b[i];
        temp -= h_c[i];
        if(temp*temp < TOL*TOL){
            ++correct;
        }else{
            printf("temp %f h_a %f h_b %f h_c %f\n",
                    temp,h_a[i],h_b[i],h_c[i]);
        }
    }

    // sum results
    printf("C = A + B: %d out of %d results were correct.\n", correct, count);

    return 0;
}
