/*
*
*      Filename: hello_mpi.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-21 22:07:04
* Last Modified: 2017-05-21 22:15:17
**/
#include <cstdio>
#include <mpi.h>

int main(int argc, char **argv)
{
    int rank, size;
    // Starts MPI
    MPI_Init(&argc,&argv); 

    // Get current process id
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    // Get number of processes
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    printf("Hello world from process %d of %d\n",rank,size);

    MPI_Finalize();
    return 0;
}

