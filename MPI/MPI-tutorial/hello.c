/*
*
*      Filename: hello.c
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-17 04:53:50
* Last Modified: 2017-08-17 04:53:50
**/
#include <stdio.h>
#include <mpi.h>

int main(int argc, char *argv[])
{
    MPI_Init(&argc, &argv); //初始化MPI环境

    printf("Hello World!\n");

    MPI_Finalize(); //结束MPI环境
    return 0;
}

