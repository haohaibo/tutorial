/*
*
*      Filename: MPI_example3.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-21 23:56:19
* Last Modified: 2017-05-22 00:08:37
**/
#include <cstdio>
#include <iostream>
#include <mpi.h>

int main(int argc, char *argv[])
{
    int numprocs, myid, tag, source, destination, count, buffer;
    MPI_Status status;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &myid);

    tag = 1234;
    source = 0;
    destination = 1;
    count = 1;

    if(myid == source)
    {
        buffer = 23333;
        MPI_Send(&buffer, count, MPI_INT,destination, tag, MPI_COMM_WORLD);
        printf("processor %d sent %d\n",myid, buffer);
    }

    if(myid == destination)
    {
        MPI_Recv(&buffer, count, MPI_INT, source, tag, MPI_COMM_WORLD, &status);
        printf("processor %d got %d\n", myid, buffer);
    }
    MPI_Finalize();
    return 0;
}


