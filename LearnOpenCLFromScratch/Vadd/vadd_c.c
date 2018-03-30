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

#ifndef DEVICE
#define DEVICE CL_DEVICE_TYPE_DEFAULT
#endif

#define TOL (0.001)    // tolerence used in floating point comparisons
#define LENGTH (1024)  // length of vector c, a and b

const char *vadd_kernel_source = "\n" \
"__kernel void vadd(                           \n" \
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
    printf("%s\n",vadd_kernel_source);

    int err;   // error code returned from OpenCL calls
    unsigned int correct; // number of correct results
    float*    h_a = malloc(LENGTH*sizeof(float));  // host vector a
    float*    h_b = malloc(LENGTH*sizeof(float));  // host vector b
    float*    h_c = malloc(LENGTH*sizeof(float));  // host vector c

    size_t global;  // global domain size

    // device
    cl_device_id     device_id; // compute device id
    cl_context       context;   // compute context
    cl_command_queue commands;  // compute command queue
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


    /*
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
       */

    // create a compute context
    context = clCreateContext(
            0,
            1,
            &device_id,
            NULL,
            NULL,
            &err);

    /*
       cl_command_queue clCreateCommandQueue(
       cl_context context,
       cl_device_id device,
       cl_command_queue_properties properties,
       cl_int *errcode_ret)
       */

    // create a command queue
    commands = clCreateCommandQueue(
            context,
            device_id,
            0,
            &err);
    return 0;
}
