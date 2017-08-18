/*
*
*      Filename: test.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-17 23:36:16
* Last Modified: 2017-08-18 00:11:08
**/
#include <stdio.h>
#include "mpi.h"

#define NPROCS 8

int main(int argc, char* argv[]){
    
    int rank, new_rank, numtasks;
    int sendbuf, recvbuf, ranks1[4]= {0,1,2,3}, ranks2[4] = {4,5,6,7};

    MPI_Group orig_group, new_group;
    MPI_Comm new_comm;

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &numtasks);

    if(numtasks != NPROCS){
        printf("Must specify MP_NPROCS = %d. Terminating\n", NPROCS);
        MPI_Finalize();
        return 0;
    }

    sendbuf = rank;

    /* Extract the original group handle */
    MPI_Comm_group(MPI_COMM_WORLD, &orig_group);


    /* Divide tasks into two distinct groups based upon rank */
    if(rank < NPROCS/2){
        MPI_Group_incl(orig_group, NPROCS/2, ranks1, &new_group);
    }else{
        MPI_Group_incl(orig_group, NPROCS/2, ranks2, &new_group);
    }

    /* Create new communicator and then perform collective communications */
    MPI_Comm_create(MPI_COMM_WORLD, new_group, &new_comm);
    MPI_Allreduce(&sendbuf, &recvbuf, 1, MPI_INT, MPI_SUM, new_comm);

    MPI_Group_rank(new_group, &new_rank);
    printf("rank= %d new_rank= %d recvbuf= %d\n", rank, new_rank,recvbuf);


    MPI_Finalize();
    return 0;
}

