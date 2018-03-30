/*
* Author: Haibo Hao
* Email : haohaibo@ncic.ac.cn
* Copyright (C) 2017 NCIC
**/

#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <math.h>

#define TOL (0.001)  //tolerence used in floating point comparisons
#define LENGTH (1024)

// perform an elements-wise addition of A and B and
// store the result in C
// there are N elements per Array
void vecadd(float *C, float *A, float *B, int N){
    for(int i = 0; i < N; ++i){
        C[i] = A[i] + B[i];
    }
}

int main(int argc, char* argv[]){
    float *h_a = calloc(LENGTH, sizeof(float)); 
    float *h_b = calloc(LENGTH, sizeof(float)); 
    float *h_c = calloc(LENGTH, sizeof(float)); 

    // Fill vectors a and b with random values
    int count = LENGTH;
    for(int i = 0; i < count; ++i){
        h_a[i] = rand() / (float)RAND_MAX;
        h_b[i] = rand() / (float)RAND_MAX;
    }

    vecadd(h_c, h_a, h_b, count);

    // random check
    int rand_a = (rand() / (float)RAND_MAX)*count;
    int rand_b = (rand() / (float)RAND_MAX)*count;
    
    if((h_a[rand_a] + h_b[rand_a]) == h_c[rand_a]){
        printf("%f + %f == %f in position %d\n",
                h_a[rand_a], h_b[rand_a], h_c[rand_a], rand_a);
        printf("[INFO] check OK\n");
    }
    if((h_a[rand_b] + h_b[rand_b]) == h_c[rand_b]){
        printf("%f + %f == %f in position %d\n",
                h_a[rand_b], h_b[rand_b], h_c[rand_b], rand_b);
        printf("[INFO] check OK\n");
    }
    return 0;
}
