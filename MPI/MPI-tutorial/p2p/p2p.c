/*
*
*      Filename: p2p.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-17 05:37:29
* Last Modified: 2017-08-17 06:03:30
**/
#include <stdio.h>
#include <string.h>
#include <mpi.h>

int main(int argv, char* argc[]){
    int rank, tot, i;
    char msg[128], rev[128];
    MPI_Status state;
    MPI_Init(&argv, &argc);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &tot);
    if(rank == 0){
        for(i = 1; i < tot; i++){
            sprintf(msg, "hello, %d, this is zero, I'am your master", i);
            MPI_Send(msg, 128, MPI_CHAR, i, 0, MPI_COMM_WORLD);
        }
        for(i = 1; i < tot; i++){
            MPI_Recv(rev, 128, MPI_CHAR, i, 0, MPI_COMM_WORLD, &state);
            printf("P%d got: %s\n", rank, rev);
        }
    }else{
        MPI_Recv(rev, 128, MPI_CHAR, 0, 0, MPI_COMM_WORLD, &state);
        printf("P%d got: %s\n", rank, rev);
        sprintf(msg, "hello, zero, this is %d, I'am your slave", rank);
        MPI_Send(msg, 128, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    }
    MPI_Finalize();
    return 0;
}

