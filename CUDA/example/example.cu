/*
*
*      Filename: example.cu
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2018-04-18 19:16:29
* Last Modified: 2018-04-18 19:16:29
**/
#include <stdio.h>

__global__ void kernel(){
    unsigned long a, b, c;
    a = 24;
    b = 12;
    c = a + b;
}

int main(int argc, char* argv[]){
    cudaFree(0);
    kernel<<<1,1>>>();
    cudaDeviceSynchronize();
    return  0;
}

