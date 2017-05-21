/*
 *
 *      Filename: L1-048.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-05-21 10:16:44
* Last Modified: 2017-05-21 11:04:06
 **/
#include <iostream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
using namespace std;
int main()
{
    int Ra,Ca,Rb,Cb;
    // read matrix A
    scanf("%d %d",&Ra,&Ca);
    int **A;
    A = (int **)malloc(sizeof(int *)*Ra);
    for(int i = 0;i<Ra;++i)
    {
        A[i] = (int *)malloc(sizeof(int)*Ca);
        for(int j = 0;j<Ca;++j)
        {
            scanf("%d",&A[i][j]);
        }
    }
    scanf("%d %d",&Rb,&Cb);
    int **B;
    B = (int **)malloc(sizeof(int *)*Rb);
    for(int i = 0;i<Rb;++i)
    {
        B[i] = (int *)malloc(sizeof(int)*Cb);
        for(int j = 0;j<Cb;++j)
        {
            scanf("%d",&B[i][j]);
        }
    }

    int **C;
    if(Ca != Rb)
    {
        printf("Error: %d != %d\n",Ca,Rb);
    }else
    {
        C = (int **)malloc(sizeof(int *)*Ra);
        for(int i = 0;i<Ra;++i)
        {
            C[i] = (int *)malloc(sizeof(int)*Cb);
            for(int j=0;j<Cb;++j)
            {
                C[i][j] = 0;
                for(int k = 0; k<Ca;++k)
                {
                    C[i][j] += A[i][k]*B[k][j];
                }
            }
        }
        printf("%d %d\n",Ra,Cb);
        for(int i = 0;i<Ra;++i)
        {
            for(int j=0;j<Cb;++j)
            {
                if(j==(Cb-1))
                {
                    printf("%d\n",C[i][j]);
                }else
                {
                    printf("%d ",C[i][j]);
                }
            }
        }
    }
    return 0;
}

