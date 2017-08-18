/*
*
*      Filename: collective_communication.c
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-17 21:09:03
* Last Modified: 2017-08-17 21:09:03
**/
#include <stdio.h>
#include "mpi.h"
#define SIZE 4

int main(int argc, char * argv[])
{
    int rank, numtasks; 
    int sendcount, recvcount, source;
    float sendbuf[SIZE][SIZE] = {
        {1.0, 2.0, 3.0, 4.0},
        {5.0, 6.0, 7.0, 8.0},
        {9,0, 10.0, 11.0, 12.0},
        {13.0, 14.0, 15.0, 16.0}
    }
    float recvbuf[SIZE][SIZE];

    MPI_Init(&argc, &argv); //开始MPI环境
    MPI_Comm_size(MPI_COMM_WORLD, numtasks);
    MPI_Comm_rank(MPI_COMM_WORLD, rank);


    MPI_Finalize(); //结束MPI环境
    return 0;
}

