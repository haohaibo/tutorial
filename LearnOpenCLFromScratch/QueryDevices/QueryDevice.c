/*
 * Author: Haibo Hao
 * Email : haohaibo@ncic.ac.cn
 * Copyright (C) 2017 NCIC
 **/

#include <stdio.h>
#include <stdlib.h>

#include <CL/cl.h>

int main(void)
{
    cl_int err;
    // Find the number of OpenCL platforms
    cl_uint num_platforms;

    /* clGetPlatformIDs function description
     *
     cl_int
     clGetPlatformIDs(
     cl_uint num_entries,
     cl_platform_id *platforms,
     cl_uint *num_platforms)
     *
     */

    err = clGetPlatformIDs(
            0,
            NULL,
            &num_platforms
            );
    printf("[INFO]  Number of OpenCL platforms: %d\n", num_platforms);

    // Create a list of platform IDs
    cl_platform_id platform[num_platforms];
    err = clGetPlatformIDs(
            num_platforms,
            platform,
            NULL
            );

    // Investigate each platform
    for(int i = 0; i < num_platforms; ++i)
    {
        printf("\n---------------------------------------------\n");
        printf("[INFO]  Platform: %d\n",i);
        cl_char string[10240] = {0};

        /*
           cl_int clGetPlatformInfo(
           cl_platform_id platform,
           cl_platform_info param_name,
           size_t param_value_size,
           void *param_value,
           size_t *param_value_size_ret)
           */

        // Print out the platform name
        err = clGetPlatformInfo(
                platform[i],
                CL_PLATFORM_NAME,
                sizeof(string),
                &string,
                NULL
                );
        printf("[INFO]  Platform name: %s\n", string); 
        //printf("[INFO]  Platform ID: %d\n", platform[i]); 

        // Print out the platform vendor
        err = clGetPlatformInfo(
                platform[i],
                CL_PLATFORM_VENDOR,
                sizeof(string),
                &string,
                NULL
                );
        printf("[INFO]  Platform vendor: %s\n", string); 

        // Print out the platform OpenCL version 
        err = clGetPlatformInfo(
                platform[i],
                CL_PLATFORM_VERSION,
                sizeof(string),
                &string,
                NULL
                );
        printf("[INFO]  Platform version: %s\n", string); 

        /*
           cl_int
           clGetDeviceIDs(
           cl_platform_id platform,
           cl_device_type device_type,
           cl_uint num_entries,
           cl_device_id *devices,
           cl_uint *num_devices)
           */

        // Count the number of devices in the platform
        cl_uint num_devices;
        err = clGetDeviceIDs(
                platform[i],
                CL_DEVICE_TYPE_ALL,
                0,
                NULL,
                &num_devices
                );
        printf("[INFO]  Number of devices: %d\n", num_devices); 
        // Get the device IDs
        cl_device_id device[num_devices];
        err = clGetDeviceIDs(
                platform[i],
                CL_DEVICE_TYPE_ALL,
                num_devices,
                device,
                NULL
                );

        // Investigate each device
        for (int j = 0; j < num_devices; ++j)
        {
            printf("\n----------------------------------------\n");
            printf("[INFO]  Device ID: %d\n",j);

            /*
               cl_int clGetDeviceInfo (
               cl_device_id  device ,
               cl_device_info  param_name ,
               size_t  param_value_size ,
               void  *param_value ,
               size_t  *param_value_size_ret )
               */

            // Get device name
            err = clGetDeviceInfo(
                    device[j],
                    CL_DEVICE_NAME,
                    sizeof(string),
                    &string,
                    NULL
                    );
            printf("[INFO]  Device name: %s\n", string); 

            cl_uint max_clock_frequency;
            // Get device max clock frequency 
            err = clGetDeviceInfo(
                    device[j],
                    CL_DEVICE_MAX_CLOCK_FREQUENCY,
                    sizeof(cl_uint),
                    &max_clock_frequency,
                    NULL
                    );
            printf("[INFO]  Device max clock frequency: %d MHz\n", max_clock_frequency); 

            // Get device OpenCL C version 
            err = clGetDeviceInfo(
                    device[j],
                    CL_DEVICE_OPENCL_C_VERSION,
                    sizeof(string),
                    &string,
                    NULL
                    );
            printf("[INFO]  Device OpenCL C version: %s\n", string); 
            // Get Max. Compute Unit 
            cl_uint num_compute_units;
            err = clGetDeviceInfo(
                    device[j],
                    CL_DEVICE_MAX_COMPUTE_UNITS,
                    sizeof(cl_uint),
                    &num_compute_units,
                    NULL
                    );
            printf("[INFO]  Device max compute units: %d\n", num_compute_units); 

            // Get local memory size(Local Data Share)
            cl_ulong local_mem_size;
            err = clGetDeviceInfo(
                    device[j],
                    CL_DEVICE_LOCAL_MEM_SIZE,
                    sizeof(cl_ulong),
                    &local_mem_size,
                    NULL
                    );
            printf("[INFO]  Device local memory size: %lu KB\n", local_mem_size/1024); 

            // Get global memory size(Device memory)
            cl_ulong global_mem_size;
            err = clGetDeviceInfo(
                    device[j],
                    CL_DEVICE_GLOBAL_MEM_SIZE,
                    sizeof(cl_ulong),
                    &global_mem_size,
                    NULL
                    );
            printf("[INFO]  Device global memory size: %lu GB\n", global_mem_size/(1024*1024*1024)); 

            // Get max buffer alloc. size
            cl_ulong max_buffer_alloc;
            err = clGetDeviceInfo(
                    device[j],
                    CL_DEVICE_MAX_MEM_ALLOC_SIZE,
                    sizeof(cl_ulong),
                    &max_buffer_alloc,
                    NULL
                    );
            printf("[INFO]  Device Max Memory Alloc. Size: %lu MB\n", max_buffer_alloc/(1024*1024)); 

            // Get work-group size information 
            size_t work_group_size;
            err = clGetDeviceInfo(
                    device[j],
                    CL_DEVICE_MAX_WORK_GROUP_SIZE,
                    sizeof(size_t),
                    &work_group_size,
                    NULL
                    );
            printf("[INFO]  Device Max Workgroup Size"
                    "(max number of work-items in a workgroup): %ld\n", work_group_size); 

            // Find the maximum dimensions of the work-groups
            size_t max_dim_workgroup;
            err = clGetDeviceInfo(
                    device[j],
                    CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS,
                    sizeof(cl_uint),
                    &max_dim_workgroup,
                    NULL
                    );
            printf("[INFO]  Device Max work-item dims: %ld\n", max_dim_workgroup); 

            // Get the max. dims of the work-groups
            size_t dims[max_dim_workgroup];
            err = clGetDeviceInfo(
                    device[j],
                    CL_DEVICE_MAX_WORK_ITEM_SIZES,
                    sizeof(dims),
                    &dims,
                    NULL
                    );

            printf("[INFO]  Max Work-group Dims: ( ");
            for (size_t k = 0; k < max_dim_workgroup; ++k)
            {
                printf("%ld ",dims[k]);
            }
            printf(")\n");
            printf("\n----------------------------------------\n");
        }
        printf("\n---------------------------------------------\n");
    }

    return 0;
}
