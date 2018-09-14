/*
*
*      Filename: bit_extract.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-30 15:31:47
* Last Modified: 2017-09-30 15:48:15
**/

#define __HIP_PLATFORM_HCC__

#include <stdio.h>
#include <iostream>
#include "hip/hip_runtime.h"
#ifdef __HIP_PLATFORM_HCC__
#include <hc.hpp>
#endif

#define CHECK(cmd) \
{\
    hipError_t error = cmd;\
    if (error != hipSuccess) { \
        fprintf(stderr, "error: '%s'(%d) at %s:%d\n", hipGetErrorString(error), error, __FILE__, __LINE__); \
        exit(EXIT_FAILURE);\
    }\
}

int main(int argc, char* argv[]){
    uint32_t *A_d, *C_d;
    uint32_t *A_h, *C_h;
    size_t N = 1000000;
    size_t Nbytes = N * sizeof(uint32_t);

    int deviceId;
    CHECK (hipGetDevice(&deviceId));
    
    std::cout << "CHECK ok" << std::endl;
    return 0;
}
