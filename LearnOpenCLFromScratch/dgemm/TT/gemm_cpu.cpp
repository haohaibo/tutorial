/*
 * Author: Haibo Hao
 * Email : haohaibo@ncic.ac.cn
 * Copyright (C) 2017 NCIC
 **/
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <math.h>
#include <memory.h>
#include "err_code.h"
#include "wtime.h"

float * matrixTranspose(int M, int N, float* A){
    float* A_trans = (float*)malloc(N*M*sizeof(float));
    for(int i = 0; i < N; ++i){
        for(int j = 0; j < M; ++j){
            A_trans[j*M + i] = A[i*N + j];
        }
    }
    return A_trans;
}

void gemm_cpu(
        const float* A,
        const float* B,
        float* C,
        const int M,
        const int N,
        const int K,
        bool transA,
        bool transB
        ){
    for(int i = 0; i < M; ++i)
    {
        for(int j = 0; j < N; ++j){
            for(int k = 0; k < K;++k){
                C[j*M + i] = A[k*M + i]*B[j*k + k];
            }
            printf("%f ", C[j*M + i]);
        }
        printf("\n");
    }
}

int main(int argc, char* argv[]){

    int M = atoi(argv[1]);
    int N = atoi(argv[2]);
    int K = atoi(argv[3]);;
    float*    h_a = (float*)malloc(M*K*sizeof(float));  // host matrix a
    float*    h_b = (float*)malloc(K*N*sizeof(float));  // host matrix b
    float*    h_c = (float*)malloc(M*N*sizeof(float));  // host matrix c

    for(int i = 0; i < M*K; ++i)
    {
        h_a[i] = rand()/(float)RAND_MAX;
    }

    for(int i = 0; i < K*N; ++i)
    {
        h_b[i] = rand()/(float)RAND_MAX;
    }
    for(int i = 0; i < M*K; ++i){
        printf("%f ", h_a[i]);
    }
    printf("\n");

    float* transA = matrixTranspose(M, K, h_a);
    for(int i = 0; i < M*K; ++i){
        printf("%f ", transA[i]);
    }
    printf("\n");

    //gemm_cpu(h_a, h_b, h_c, M, N, K, 0, 0);

    return 0;
}
