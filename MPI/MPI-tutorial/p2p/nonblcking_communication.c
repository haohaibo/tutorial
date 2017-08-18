/*
*
*      Filename: nonblcking_communication.c
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-17 19:19:50
* Last Modified: 2017-08-17 19:19:50
**/
#include <stdio.h>
#include <unistd.h>
#include "mpi.h"

int main(int argc, char* argv[]){
    int numtasks, rank, next, prev, buf[2], tag1 = 1, tag2 = 2;
    MPI_Request reqs[4];
    MPI_Status stats[4];
    buf[0] = -1;
    buf[1] = -1;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &numtasks);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    prev = rank - 1;
    next = rank + 1;

    if(rank == 0)
        prev = numtasks - 1;
    if(rank == (numtasks - 1))
        next = 0;
    MPI_Irecv(&buf[0], 1, MPI_INT, prev, tag1, MPI_COMM_WORLD, &reqs[0]);
    MPI_Irecv(&buf[1], 1, MPI_INT, next, tag2, MPI_COMM_WORLD, &reqs[1]);

    printf("buffer before wait%d %d\n", buf[0], buf[1]);
    sleep(2);

    MPI_Isend(&rank, 1, MPI_INT, prev, tag2, MPI_COMM_WORLD, &reqs[2]);
    MPI_Isend(&rank, 1, MPI_INT, next, tag1, MPI_COMM_WORLD, &reqs[3]);

    MPI_Waitall(4, reqs, stats);
    printf("task %d got %d from prev\n", rank, buf[0]);
    printf("task %d got %d from next\n", rank, buf[1]);

    MPI_Finalize();
    return 0;
}

