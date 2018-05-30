//#include <CL/cl.h>
//#include "err_code.h"
//#include "wtime.h"
//
// algo: outer product GEMM
// global work size {M/8, N/8}
// local work size {8,8} 8x8 (each thread compute 8x8 c's)
__kernel void gemm(
        const __global float* A,
        const __global float* B,
        __global float* C,
        const int M,
        const int N,
        const int K){
    // global thread id
    //int global_thread_id_x = 
    //    get_group_id(0)*get_local_size(0) 
    //    + get_local_id(0);
    //int global_thread_id_y = 
    //    get_group_id(1)*get_local_size(1) 
    //    + get_local_id(1);

    // for clear thread and block name
    int local_thread_id_x = get_local_id(0);
    int local_thread_id_y = get_local_id(1);
    int local_thread_id = get_local_size(0)*local_thread_id_y + local_thread_id_x;
    local_thread_id = 8*local_thread_id_y + local_thread_id_x;

    int block_id_x = get_group_id(0);
    int block_id_y = get_group_id(1);


    // loop unroll
    int NUM_UNROLL = 8;

    // number of c's each thread compute
    int thread_task_x = 8;
    int thread_task_y = 8;
    int thread_task = thread_task_x*thread_task_y;

    // tile dim of C matrix 64*64
    int tile_dim_x = thread_task_x*get_local_size(0);
    tile_dim_x = 64;
    int tile_dim_y = thread_task_y*get_local_size(1);
    tile_dim_y = 64;

    // shared memory
    //__local float tileA[tile_dim_x * NUM_UNROLL];
    //__local float tileB[tile_dim_y * NUM_UNROLL];
    __local float tileA[64 * 8 * 2];
    //__local float tileA_bak[64 * 8];
    __local float tileB[64 * 8 * 2];
    //__local float tileB_bak[64 * 8];
    //__local float tileC[tile_dim_x * tile_dim_y];

    // for global -> register loadA, loadB
    __private float loadA[8];
    __private float loadB[8];

    // registers for float-multiply-add 
    //float regA[thread_task_x], regB[thread_task_y];
    //float regA_bak[thread_task_x], regB_bak[thread_task_y];
    //float regC[thread_task_y][thread_task_x];
    __private float regA[8], regB[8];
    //__private float regA_bak[8], regB_bak[8];
    __private float regC[8*8];

    // clear regC
    //for(int i = 0; i < thread_task_y*thread_task_x; ++i){
    //    regC[i] = 0;
    //}
    // col 0
    regC[0*8 + 0] = 0;
    regC[0*8 + 1] = 0;
    regC[0*8 + 2] = 0;
    regC[0*8 + 3] = 0;
    regC[0*8 + 4] = 0;
    regC[0*8 + 5] = 0;
    regC[0*8 + 6] = 0;
    regC[0*8 + 7] = 0;

    // col 1
    regC[1*8 + 0] = 0;
    regC[1*8 + 1] = 0;
    regC[1*8 + 2] = 0;
    regC[1*8 + 3] = 0;
    regC[1*8 + 4] = 0;
    regC[1*8 + 5] = 0;
    regC[1*8 + 6] = 0;
    regC[1*8 + 7] = 0;

    // col 2
    regC[2*8 + 0] = 0;
    regC[2*8 + 1] = 0;
    regC[2*8 + 2] = 0;
    regC[2*8 + 3] = 0;
    regC[2*8 + 4] = 0;
    regC[2*8 + 5] = 0;
    regC[2*8 + 6] = 0;
    regC[2*8 + 7] = 0;

    // col 3
    regC[3*8 + 0] = 0;
    regC[3*8 + 1] = 0;
    regC[3*8 + 2] = 0;
    regC[3*8 + 3] = 0;
    regC[3*8 + 4] = 0;
    regC[3*8 + 5] = 0;
    regC[3*8 + 6] = 0;
    regC[3*8 + 7] = 0;

    // col 4
    regC[4*8 + 0] = 0;
    regC[4*8 + 1] = 0;
    regC[4*8 + 2] = 0;
    regC[4*8 + 3] = 0;
    regC[4*8 + 4] = 0;
    regC[4*8 + 5] = 0;
    regC[4*8 + 6] = 0;
    regC[4*8 + 7] = 0;

    // col 5 
    regC[5*8 + 0] = 0;
    regC[5*8 + 1] = 0;
    regC[5*8 + 2] = 0;
    regC[5*8 + 3] = 0;
    regC[5*8 + 4] = 0;
    regC[5*8 + 5] = 0;
    regC[5*8 + 6] = 0;
    regC[5*8 + 7] = 0;

    // col 6 
    regC[6*8 + 0] = 0;
    regC[6*8 + 1] = 0;
    regC[6*8 + 2] = 0;
    regC[6*8 + 3] = 0;
    regC[6*8 + 4] = 0;
    regC[6*8 + 5] = 0;
    regC[6*8 + 6] = 0;
    regC[6*8 + 7] = 0;

    // col 7 
    regC[7*8 + 0] = 0;
    regC[7*8 + 1] = 0;
    regC[7*8 + 2] = 0;
    regC[7*8 + 3] = 0;
    regC[7*8 + 4] = 0;
    regC[7*8 + 5] = 0;
    regC[7*8 + 6] = 0;
    regC[7*8 + 7] = 0;



    // pre global -> register

    loadA[0] = A[(0*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 0];
    loadA[1] = A[(0*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 1];
    loadA[2] = A[(0*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 2];
    loadA[3] = A[(0*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 3];
    loadA[4] = A[(0*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 4];
    loadA[5] = A[(0*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 5];
    loadA[6] = A[(0*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 6];
    loadA[7] = A[(0*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 7];

    loadB[0] = B[(block_id_y*tile_dim_y + local_thread_id)*K + 0*NUM_UNROLL + 0];
    loadB[1] = B[(block_id_y*tile_dim_y + local_thread_id)*K + 0*NUM_UNROLL + 1];
    loadB[2] = B[(block_id_y*tile_dim_y + local_thread_id)*K + 0*NUM_UNROLL + 2];
    loadB[3] = B[(block_id_y*tile_dim_y + local_thread_id)*K + 0*NUM_UNROLL + 3];
    loadB[4] = B[(block_id_y*tile_dim_y + local_thread_id)*K + 0*NUM_UNROLL + 4];
    loadB[5] = B[(block_id_y*tile_dim_y + local_thread_id)*K + 0*NUM_UNROLL + 5];
    loadB[6] = B[(block_id_y*tile_dim_y + local_thread_id)*K + 0*NUM_UNROLL + 6];
    loadB[7] = B[(block_id_y*tile_dim_y + local_thread_id)*K + 0*NUM_UNROLL + 7];

    barrier(CLK_GLOBAL_MEM_FENCE);


    __private int swap_index = 0;

    for(int i = 0; i < K/NUM_UNROLL; ++i){

        // register -> shared
        tileA[swap_index + local_thread_id_y*64 + local_thread_id_x*8 + 0] = loadA[0];
        tileA[swap_index + local_thread_id_y*64 + local_thread_id_x*8 + 1] = loadA[1];
        tileA[swap_index + local_thread_id_y*64 + local_thread_id_x*8 + 2] = loadA[2];
        tileA[swap_index + local_thread_id_y*64 + local_thread_id_x*8 + 3] = loadA[3];
        tileA[swap_index + local_thread_id_y*64 + local_thread_id_x*8 + 4] = loadA[4];
        tileA[swap_index + local_thread_id_y*64 + local_thread_id_x*8 + 5] = loadA[5];
        tileA[swap_index + local_thread_id_y*64 + local_thread_id_x*8 + 6] = loadA[6];
        tileA[swap_index + local_thread_id_y*64 + local_thread_id_x*8 + 7] = loadA[7];

        tileB[swap_index + local_thread_id + 0*tile_dim_y] = loadB[0];
        tileB[swap_index + local_thread_id + 1*tile_dim_y] = loadB[1];
        tileB[swap_index + local_thread_id + 2*tile_dim_y] = loadB[2];
        tileB[swap_index + local_thread_id + 3*tile_dim_y] = loadB[3];
        tileB[swap_index + local_thread_id + 4*tile_dim_y] = loadB[4];
        tileB[swap_index + local_thread_id + 5*tile_dim_y] = loadB[5];
        tileB[swap_index + local_thread_id + 6*tile_dim_y] = loadB[6];
        tileB[swap_index + local_thread_id + 7*tile_dim_y] = loadB[7];

        barrier(CLK_LOCAL_MEM_FENCE);

        // next global -> register

        if( i != (K/NUM_UNROLL -1)){
            loadA[0] = A[((i+1)*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 0];
            loadA[1] = A[((i+1)*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 1];
            loadA[2] = A[((i+1)*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 2];
            loadA[3] = A[((i+1)*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 3];
            loadA[4] = A[((i+1)*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 4];
            loadA[5] = A[((i+1)*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 5];
            loadA[6] = A[((i+1)*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 6];
            loadA[7] = A[((i+1)*NUM_UNROLL + local_thread_id_y)*M + block_id_x*tile_dim_x + local_thread_id_x*8 + 7];

            loadB[0] = B[(block_id_y*tile_dim_y + local_thread_id)*K + (i+1)*NUM_UNROLL + 0];
            loadB[1] = B[(block_id_y*tile_dim_y + local_thread_id)*K + (i+1)*NUM_UNROLL + 1];
            loadB[2] = B[(block_id_y*tile_dim_y + local_thread_id)*K + (i+1)*NUM_UNROLL + 2];
            loadB[3] = B[(block_id_y*tile_dim_y + local_thread_id)*K + (i+1)*NUM_UNROLL + 3];
            loadB[4] = B[(block_id_y*tile_dim_y + local_thread_id)*K + (i+1)*NUM_UNROLL + 4];
            loadB[5] = B[(block_id_y*tile_dim_y + local_thread_id)*K + (i+1)*NUM_UNROLL + 5];
            loadB[6] = B[(block_id_y*tile_dim_y + local_thread_id)*K + (i+1)*NUM_UNROLL + 6];
            loadB[7] = B[(block_id_y*tile_dim_y + local_thread_id)*K + (i+1)*NUM_UNROLL + 7];

            barrier(CLK_GLOBAL_MEM_FENCE);
        }


        // unroll 0
        // load A, B from shared memory to registers and compute C
        regA[0] = tileA[swap_index + 0*tile_dim_x + local_thread_id_x*8 + 0];
        regA[1] = tileA[swap_index + 0*tile_dim_x + local_thread_id_x*8 + 1];
        regA[2] = tileA[swap_index + 0*tile_dim_x + local_thread_id_x*8 + 2];
        regA[3] = tileA[swap_index + 0*tile_dim_x + local_thread_id_x*8 + 3];
        regA[4] = tileA[swap_index + 0*tile_dim_x + local_thread_id_x*8 + 4];
        regA[5] = tileA[swap_index + 0*tile_dim_x + local_thread_id_x*8 + 5];
        regA[6] = tileA[swap_index + 0*tile_dim_x + local_thread_id_x*8 + 6];
        regA[7] = tileA[swap_index + 0*tile_dim_x + local_thread_id_x*8 + 7];


        regB[0] = tileB[swap_index + 0*tile_dim_y + local_thread_id_y*8 + 0];
        regB[1] = tileB[swap_index + 0*tile_dim_y + local_thread_id_y*8 + 1];
        regB[2] = tileB[swap_index + 0*tile_dim_y + local_thread_id_y*8 + 2];
        regB[3] = tileB[swap_index + 0*tile_dim_y + local_thread_id_y*8 + 3];
        regB[4] = tileB[swap_index + 0*tile_dim_y + local_thread_id_y*8 + 4];
        regB[5] = tileB[swap_index + 0*tile_dim_y + local_thread_id_y*8 + 5];
        regB[6] = tileB[swap_index + 0*tile_dim_y + local_thread_id_y*8 + 6];
        regB[7] = tileB[swap_index + 0*tile_dim_y + local_thread_id_y*8 + 7];

        // Synchronise to make sure the tile 
        // is loaded from shared to registers
        //barrier(CLK_LOCAL_MEM_FENCE);

        // col 0
        regC[0*8 + 0] += regA[0]* regB[0];
        regC[0*8 + 1] += regA[1]* regB[0];
        regC[0*8 + 2] += regA[2]* regB[0];
        regC[0*8 + 3] += regA[3]* regB[0];
        regC[0*8 + 4] += regA[4]* regB[0];
        regC[0*8 + 5] += regA[5]* regB[0];
        regC[0*8 + 6] += regA[6]* regB[0];
        regC[0*8 + 7] += regA[7]* regB[0];

        // col 1 
        regC[1*8 + 0] += regA[0]* regB[1];
        regC[1*8 + 1] += regA[1]* regB[1];
        regC[1*8 + 2] += regA[2]* regB[1];
        regC[1*8 + 3] += regA[3]* regB[1];
        regC[1*8 + 4] += regA[4]* regB[1];
        regC[1*8 + 5] += regA[5]* regB[1];
        regC[1*8 + 6] += regA[6]* regB[1];
        regC[1*8 + 7] += regA[7]* regB[1];

        // col 2
        regC[2*8 + 0] += regA[0]* regB[2];
        regC[2*8 + 1] += regA[1]* regB[2];
        regC[2*8 + 2] += regA[2]* regB[2];
        regC[2*8 + 3] += regA[3]* regB[2];
        regC[2*8 + 4] += regA[4]* regB[2];
        regC[2*8 + 5] += regA[5]* regB[2];
        regC[2*8 + 6] += regA[6]* regB[2];
        regC[2*8 + 7] += regA[7]* regB[2];

        // col 3
        regC[3*8 + 0] += regA[0]* regB[3];
        regC[3*8 + 1] += regA[1]* regB[3];
        regC[3*8 + 2] += regA[2]* regB[3];
        regC[3*8 + 3] += regA[3]* regB[3];
        regC[3*8 + 4] += regA[4]* regB[3];
        regC[3*8 + 5] += regA[5]* regB[3];
        regC[3*8 + 6] += regA[6]* regB[3];
        regC[3*8 + 7] += regA[7]* regB[3];

        // col 4
        regC[4*8 + 0] += regA[0]* regB[4];
        regC[4*8 + 1] += regA[1]* regB[4];
        regC[4*8 + 2] += regA[2]* regB[4];
        regC[4*8 + 3] += regA[3]* regB[4];
        regC[4*8 + 4] += regA[4]* regB[4];
        regC[4*8 + 5] += regA[5]* regB[4];
        regC[4*8 + 6] += regA[6]* regB[4];
        regC[4*8 + 7] += regA[7]* regB[4];

        // col 5
        regC[5*8 + 0] += regA[0]* regB[5];
        regC[5*8 + 1] += regA[1]* regB[5];
        regC[5*8 + 2] += regA[2]* regB[5];
        regC[5*8 + 3] += regA[3]* regB[5];
        regC[5*8 + 4] += regA[4]* regB[5];
        regC[5*8 + 5] += regA[5]* regB[5];
        regC[5*8 + 6] += regA[6]* regB[5];
        regC[5*8 + 7] += regA[7]* regB[5];

        // col 6
        regC[6*8 + 0] += regA[0]* regB[6];
        regC[6*8 + 1] += regA[1]* regB[6];
        regC[6*8 + 2] += regA[2]* regB[6];
        regC[6*8 + 3] += regA[3]* regB[6];
        regC[6*8 + 4] += regA[4]* regB[6];
        regC[6*8 + 5] += regA[5]* regB[6];
        regC[6*8 + 6] += regA[6]* regB[6];
        regC[6*8 + 7] += regA[7]* regB[6];

        // col 7
        regC[7*8 + 0] += regA[0]* regB[7];
        regC[7*8 + 1] += regA[1]* regB[7];
        regC[7*8 + 2] += regA[2]* regB[7];
        regC[7*8 + 3] += regA[3]* regB[7];
        regC[7*8 + 4] += regA[4]* regB[7];
        regC[7*8 + 5] += regA[5]* regB[7];
        regC[7*8 + 6] += regA[6]* regB[7];
        regC[7*8 + 7] += regA[7]* regB[7];

        // Synchronise before loading 
        // the next tile of A, B to registers 
        //barrier(CLK_LOCAL_MEM_FENCE);


        // unroll 1
        // load A, B from shared memory to registers and compute C
        regA[0] = tileA[swap_index + 1*tile_dim_x + local_thread_id_x*8 + 0];
        regA[1] = tileA[swap_index + 1*tile_dim_x + local_thread_id_x*8 + 1];
        regA[2] = tileA[swap_index + 1*tile_dim_x + local_thread_id_x*8 + 2];
        regA[3] = tileA[swap_index + 1*tile_dim_x + local_thread_id_x*8 + 3];
        regA[4] = tileA[swap_index + 1*tile_dim_x + local_thread_id_x*8 + 4];
        regA[5] = tileA[swap_index + 1*tile_dim_x + local_thread_id_x*8 + 5];
        regA[6] = tileA[swap_index + 1*tile_dim_x + local_thread_id_x*8 + 6];
        regA[7] = tileA[swap_index + 1*tile_dim_x + local_thread_id_x*8 + 7];


        regB[0] = tileB[swap_index + 1*tile_dim_y + local_thread_id_y*8 + 0];
        regB[1] = tileB[swap_index + 1*tile_dim_y + local_thread_id_y*8 + 1];
        regB[2] = tileB[swap_index + 1*tile_dim_y + local_thread_id_y*8 + 2];
        regB[3] = tileB[swap_index + 1*tile_dim_y + local_thread_id_y*8 + 3];
        regB[4] = tileB[swap_index + 1*tile_dim_y + local_thread_id_y*8 + 4];
        regB[5] = tileB[swap_index + 1*tile_dim_y + local_thread_id_y*8 + 5];
        regB[6] = tileB[swap_index + 1*tile_dim_y + local_thread_id_y*8 + 6];
        regB[7] = tileB[swap_index + 1*tile_dim_y + local_thread_id_y*8 + 7];

        // Synchronise to make sure the tile 
        // is loaded from shared to registers
        //barrier(CLK_LOCAL_MEM_FENCE);

        // col 0
        regC[0*8 + 0] += regA[0]* regB[0];
        regC[0*8 + 1] += regA[1]* regB[0];
        regC[0*8 + 2] += regA[2]* regB[0];
        regC[0*8 + 3] += regA[3]* regB[0];
        regC[0*8 + 4] += regA[4]* regB[0];
        regC[0*8 + 5] += regA[5]* regB[0];
        regC[0*8 + 6] += regA[6]* regB[0];
        regC[0*8 + 7] += regA[7]* regB[0];

        // col 1 
        regC[1*8 + 0] += regA[0]* regB[1];
        regC[1*8 + 1] += regA[1]* regB[1];
        regC[1*8 + 2] += regA[2]* regB[1];
        regC[1*8 + 3] += regA[3]* regB[1];
        regC[1*8 + 4] += regA[4]* regB[1];
        regC[1*8 + 5] += regA[5]* regB[1];
        regC[1*8 + 6] += regA[6]* regB[1];
        regC[1*8 + 7] += regA[7]* regB[1];

        // col 2
        regC[2*8 + 0] += regA[0]* regB[2];
        regC[2*8 + 1] += regA[1]* regB[2];
        regC[2*8 + 2] += regA[2]* regB[2];
        regC[2*8 + 3] += regA[3]* regB[2];
        regC[2*8 + 4] += regA[4]* regB[2];
        regC[2*8 + 5] += regA[5]* regB[2];
        regC[2*8 + 6] += regA[6]* regB[2];
        regC[2*8 + 7] += regA[7]* regB[2];

        // col 3
        regC[3*8 + 0] += regA[0]* regB[3];
        regC[3*8 + 1] += regA[1]* regB[3];
        regC[3*8 + 2] += regA[2]* regB[3];
        regC[3*8 + 3] += regA[3]* regB[3];
        regC[3*8 + 4] += regA[4]* regB[3];
        regC[3*8 + 5] += regA[5]* regB[3];
        regC[3*8 + 6] += regA[6]* regB[3];
        regC[3*8 + 7] += regA[7]* regB[3];

        // col 4
        regC[4*8 + 0] += regA[0]* regB[4];
        regC[4*8 + 1] += regA[1]* regB[4];
        regC[4*8 + 2] += regA[2]* regB[4];
        regC[4*8 + 3] += regA[3]* regB[4];
        regC[4*8 + 4] += regA[4]* regB[4];
        regC[4*8 + 5] += regA[5]* regB[4];
        regC[4*8 + 6] += regA[6]* regB[4];
        regC[4*8 + 7] += regA[7]* regB[4];

        // col 5
        regC[5*8 + 0] += regA[0]* regB[5];
        regC[5*8 + 1] += regA[1]* regB[5];
        regC[5*8 + 2] += regA[2]* regB[5];
        regC[5*8 + 3] += regA[3]* regB[5];
        regC[5*8 + 4] += regA[4]* regB[5];
        regC[5*8 + 5] += regA[5]* regB[5];
        regC[5*8 + 6] += regA[6]* regB[5];
        regC[5*8 + 7] += regA[7]* regB[5];

        // col 6
        regC[6*8 + 0] += regA[0]* regB[6];
        regC[6*8 + 1] += regA[1]* regB[6];
        regC[6*8 + 2] += regA[2]* regB[6];
        regC[6*8 + 3] += regA[3]* regB[6];
        regC[6*8 + 4] += regA[4]* regB[6];
        regC[6*8 + 5] += regA[5]* regB[6];
        regC[6*8 + 6] += regA[6]* regB[6];
        regC[6*8 + 7] += regA[7]* regB[6];

        // col 7
        regC[7*8 + 0] += regA[0]* regB[7];
        regC[7*8 + 1] += regA[1]* regB[7];
        regC[7*8 + 2] += regA[2]* regB[7];
        regC[7*8 + 3] += regA[3]* regB[7];
        regC[7*8 + 4] += regA[4]* regB[7];
        regC[7*8 + 5] += regA[5]* regB[7];
        regC[7*8 + 6] += regA[6]* regB[7];
        regC[7*8 + 7] += regA[7]* regB[7];


        // unroll 2 
        // load A, B from shared memory to registers and compute C
        regA[0] = tileA[swap_index + 2*tile_dim_x + local_thread_id_x*8 + 0];
        regA[1] = tileA[swap_index + 2*tile_dim_x + local_thread_id_x*8 + 1];
        regA[2] = tileA[swap_index + 2*tile_dim_x + local_thread_id_x*8 + 2];
        regA[3] = tileA[swap_index + 2*tile_dim_x + local_thread_id_x*8 + 3];
        regA[4] = tileA[swap_index + 2*tile_dim_x + local_thread_id_x*8 + 4];
        regA[5] = tileA[swap_index + 2*tile_dim_x + local_thread_id_x*8 + 5];
        regA[6] = tileA[swap_index + 2*tile_dim_x + local_thread_id_x*8 + 6];
        regA[7] = tileA[swap_index + 2*tile_dim_x + local_thread_id_x*8 + 7];


        regB[0] = tileB[swap_index + 2*tile_dim_y + local_thread_id_y*8 + 0];
        regB[1] = tileB[swap_index + 2*tile_dim_y + local_thread_id_y*8 + 1];
        regB[2] = tileB[swap_index + 2*tile_dim_y + local_thread_id_y*8 + 2];
        regB[3] = tileB[swap_index + 2*tile_dim_y + local_thread_id_y*8 + 3];
        regB[4] = tileB[swap_index + 2*tile_dim_y + local_thread_id_y*8 + 4];
        regB[5] = tileB[swap_index + 2*tile_dim_y + local_thread_id_y*8 + 5];
        regB[6] = tileB[swap_index + 2*tile_dim_y + local_thread_id_y*8 + 6];
        regB[7] = tileB[swap_index + 2*tile_dim_y + local_thread_id_y*8 + 7];

        // Synchronise to make sure the tile 
        // is loaded from shared to registers
        //barrier(CLK_LOCAL_MEM_FENCE);

        // col 0
        regC[0*8 + 0] += regA[0]* regB[0];
        regC[0*8 + 1] += regA[1]* regB[0];
        regC[0*8 + 2] += regA[2]* regB[0];
        regC[0*8 + 3] += regA[3]* regB[0];
        regC[0*8 + 4] += regA[4]* regB[0];
        regC[0*8 + 5] += regA[5]* regB[0];
        regC[0*8 + 6] += regA[6]* regB[0];
        regC[0*8 + 7] += regA[7]* regB[0];

        // col 1 
        regC[1*8 + 0] += regA[0]* regB[1];
        regC[1*8 + 1] += regA[1]* regB[1];
        regC[1*8 + 2] += regA[2]* regB[1];
        regC[1*8 + 3] += regA[3]* regB[1];
        regC[1*8 + 4] += regA[4]* regB[1];
        regC[1*8 + 5] += regA[5]* regB[1];
        regC[1*8 + 6] += regA[6]* regB[1];
        regC[1*8 + 7] += regA[7]* regB[1];

        // col 2
        regC[2*8 + 0] += regA[0]* regB[2];
        regC[2*8 + 1] += regA[1]* regB[2];
        regC[2*8 + 2] += regA[2]* regB[2];
        regC[2*8 + 3] += regA[3]* regB[2];
        regC[2*8 + 4] += regA[4]* regB[2];
        regC[2*8 + 5] += regA[5]* regB[2];
        regC[2*8 + 6] += regA[6]* regB[2];
        regC[2*8 + 7] += regA[7]* regB[2];

        // col 3
        regC[3*8 + 0] += regA[0]* regB[3];
        regC[3*8 + 1] += regA[1]* regB[3];
        regC[3*8 + 2] += regA[2]* regB[3];
        regC[3*8 + 3] += regA[3]* regB[3];
        regC[3*8 + 4] += regA[4]* regB[3];
        regC[3*8 + 5] += regA[5]* regB[3];
        regC[3*8 + 6] += regA[6]* regB[3];
        regC[3*8 + 7] += regA[7]* regB[3];

        // col 4
        regC[4*8 + 0] += regA[0]* regB[4];
        regC[4*8 + 1] += regA[1]* regB[4];
        regC[4*8 + 2] += regA[2]* regB[4];
        regC[4*8 + 3] += regA[3]* regB[4];
        regC[4*8 + 4] += regA[4]* regB[4];
        regC[4*8 + 5] += regA[5]* regB[4];
        regC[4*8 + 6] += regA[6]* regB[4];
        regC[4*8 + 7] += regA[7]* regB[4];

        // col 5
        regC[5*8 + 0] += regA[0]* regB[5];
        regC[5*8 + 1] += regA[1]* regB[5];
        regC[5*8 + 2] += regA[2]* regB[5];
        regC[5*8 + 3] += regA[3]* regB[5];
        regC[5*8 + 4] += regA[4]* regB[5];
        regC[5*8 + 5] += regA[5]* regB[5];
        regC[5*8 + 6] += regA[6]* regB[5];
        regC[5*8 + 7] += regA[7]* regB[5];

        // col 6
        regC[6*8 + 0] += regA[0]* regB[6];
        regC[6*8 + 1] += regA[1]* regB[6];
        regC[6*8 + 2] += regA[2]* regB[6];
        regC[6*8 + 3] += regA[3]* regB[6];
        regC[6*8 + 4] += regA[4]* regB[6];
        regC[6*8 + 5] += regA[5]* regB[6];
        regC[6*8 + 6] += regA[6]* regB[6];
        regC[6*8 + 7] += regA[7]* regB[6];

        // col 7
        regC[7*8 + 0] += regA[0]* regB[7];
        regC[7*8 + 1] += regA[1]* regB[7];
        regC[7*8 + 2] += regA[2]* regB[7];
        regC[7*8 + 3] += regA[3]* regB[7];
        regC[7*8 + 4] += regA[4]* regB[7];
        regC[7*8 + 5] += regA[5]* regB[7];
        regC[7*8 + 6] += regA[6]* regB[7];
        regC[7*8 + 7] += regA[7]* regB[7];



        // unroll 3 
        // load A, B from shared memory to registers and compute C
        regA[0] = tileA[swap_index + 3*tile_dim_x + local_thread_id_x*8 + 0];
        regA[1] = tileA[swap_index + 3*tile_dim_x + local_thread_id_x*8 + 1];
        regA[2] = tileA[swap_index + 3*tile_dim_x + local_thread_id_x*8 + 2];
        regA[3] = tileA[swap_index + 3*tile_dim_x + local_thread_id_x*8 + 3];
        regA[4] = tileA[swap_index + 3*tile_dim_x + local_thread_id_x*8 + 4];
        regA[5] = tileA[swap_index + 3*tile_dim_x + local_thread_id_x*8 + 5];
        regA[6] = tileA[swap_index + 3*tile_dim_x + local_thread_id_x*8 + 6];
        regA[7] = tileA[swap_index + 3*tile_dim_x + local_thread_id_x*8 + 7];


        regB[0] = tileB[swap_index + 3*tile_dim_y + local_thread_id_y*8 + 0];
        regB[1] = tileB[swap_index + 3*tile_dim_y + local_thread_id_y*8 + 1];
        regB[2] = tileB[swap_index + 3*tile_dim_y + local_thread_id_y*8 + 2];
        regB[3] = tileB[swap_index + 3*tile_dim_y + local_thread_id_y*8 + 3];
        regB[4] = tileB[swap_index + 3*tile_dim_y + local_thread_id_y*8 + 4];
        regB[5] = tileB[swap_index + 3*tile_dim_y + local_thread_id_y*8 + 5];
        regB[6] = tileB[swap_index + 3*tile_dim_y + local_thread_id_y*8 + 6];
        regB[7] = tileB[swap_index + 3*tile_dim_y + local_thread_id_y*8 + 7];

        // Synchronise to make sure the tile 
        // is loaded from shared to registers
        //barrier(CLK_LOCAL_MEM_FENCE);

        // col 0
        regC[0*8 + 0] += regA[0]* regB[0];
        regC[0*8 + 1] += regA[1]* regB[0];
        regC[0*8 + 2] += regA[2]* regB[0];
        regC[0*8 + 3] += regA[3]* regB[0];
        regC[0*8 + 4] += regA[4]* regB[0];
        regC[0*8 + 5] += regA[5]* regB[0];
        regC[0*8 + 6] += regA[6]* regB[0];
        regC[0*8 + 7] += regA[7]* regB[0];

        // col 1 
        regC[1*8 + 0] += regA[0]* regB[1];
        regC[1*8 + 1] += regA[1]* regB[1];
        regC[1*8 + 2] += regA[2]* regB[1];
        regC[1*8 + 3] += regA[3]* regB[1];
        regC[1*8 + 4] += regA[4]* regB[1];
        regC[1*8 + 5] += regA[5]* regB[1];
        regC[1*8 + 6] += regA[6]* regB[1];
        regC[1*8 + 7] += regA[7]* regB[1];

        // col 2
        regC[2*8 + 0] += regA[0]* regB[2];
        regC[2*8 + 1] += regA[1]* regB[2];
        regC[2*8 + 2] += regA[2]* regB[2];
        regC[2*8 + 3] += regA[3]* regB[2];
        regC[2*8 + 4] += regA[4]* regB[2];
        regC[2*8 + 5] += regA[5]* regB[2];
        regC[2*8 + 6] += regA[6]* regB[2];
        regC[2*8 + 7] += regA[7]* regB[2];

        // col 3
        regC[3*8 + 0] += regA[0]* regB[3];
        regC[3*8 + 1] += regA[1]* regB[3];
        regC[3*8 + 2] += regA[2]* regB[3];
        regC[3*8 + 3] += regA[3]* regB[3];
        regC[3*8 + 4] += regA[4]* regB[3];
        regC[3*8 + 5] += regA[5]* regB[3];
        regC[3*8 + 6] += regA[6]* regB[3];
        regC[3*8 + 7] += regA[7]* regB[3];

        // col 4
        regC[4*8 + 0] += regA[0]* regB[4];
        regC[4*8 + 1] += regA[1]* regB[4];
        regC[4*8 + 2] += regA[2]* regB[4];
        regC[4*8 + 3] += regA[3]* regB[4];
        regC[4*8 + 4] += regA[4]* regB[4];
        regC[4*8 + 5] += regA[5]* regB[4];
        regC[4*8 + 6] += regA[6]* regB[4];
        regC[4*8 + 7] += regA[7]* regB[4];

        // col 5
        regC[5*8 + 0] += regA[0]* regB[5];
        regC[5*8 + 1] += regA[1]* regB[5];
        regC[5*8 + 2] += regA[2]* regB[5];
        regC[5*8 + 3] += regA[3]* regB[5];
        regC[5*8 + 4] += regA[4]* regB[5];
        regC[5*8 + 5] += regA[5]* regB[5];
        regC[5*8 + 6] += regA[6]* regB[5];
        regC[5*8 + 7] += regA[7]* regB[5];

        // col 6
        regC[6*8 + 0] += regA[0]* regB[6];
        regC[6*8 + 1] += regA[1]* regB[6];
        regC[6*8 + 2] += regA[2]* regB[6];
        regC[6*8 + 3] += regA[3]* regB[6];
        regC[6*8 + 4] += regA[4]* regB[6];
        regC[6*8 + 5] += regA[5]* regB[6];
        regC[6*8 + 6] += regA[6]* regB[6];
        regC[6*8 + 7] += regA[7]* regB[6];

        // col 7
        regC[7*8 + 0] += regA[0]* regB[7];
        regC[7*8 + 1] += regA[1]* regB[7];
        regC[7*8 + 2] += regA[2]* regB[7];
        regC[7*8 + 3] += regA[3]* regB[7];
        regC[7*8 + 4] += regA[4]* regB[7];
        regC[7*8 + 5] += regA[5]* regB[7];
        regC[7*8 + 6] += regA[6]* regB[7];
        regC[7*8 + 7] += regA[7]* regB[7];


        // unroll 4 
        // load A, B from shared memory to registers and compute C
        regA[0] = tileA[swap_index + 4*tile_dim_x + local_thread_id_x*8 + 0];
        regA[1] = tileA[swap_index + 4*tile_dim_x + local_thread_id_x*8 + 1];
        regA[2] = tileA[swap_index + 4*tile_dim_x + local_thread_id_x*8 + 2];
        regA[3] = tileA[swap_index + 4*tile_dim_x + local_thread_id_x*8 + 3];
        regA[4] = tileA[swap_index + 4*tile_dim_x + local_thread_id_x*8 + 4];
        regA[5] = tileA[swap_index + 4*tile_dim_x + local_thread_id_x*8 + 5];
        regA[6] = tileA[swap_index + 4*tile_dim_x + local_thread_id_x*8 + 6];
        regA[7] = tileA[swap_index + 4*tile_dim_x + local_thread_id_x*8 + 7];


        regB[0] = tileB[swap_index + 4*tile_dim_y + local_thread_id_y*8 + 0];
        regB[1] = tileB[swap_index + 4*tile_dim_y + local_thread_id_y*8 + 1];
        regB[2] = tileB[swap_index + 4*tile_dim_y + local_thread_id_y*8 + 2];
        regB[3] = tileB[swap_index + 4*tile_dim_y + local_thread_id_y*8 + 3];
        regB[4] = tileB[swap_index + 4*tile_dim_y + local_thread_id_y*8 + 4];
        regB[5] = tileB[swap_index + 4*tile_dim_y + local_thread_id_y*8 + 5];
        regB[6] = tileB[swap_index + 4*tile_dim_y + local_thread_id_y*8 + 6];
        regB[7] = tileB[swap_index + 4*tile_dim_y + local_thread_id_y*8 + 7];

        // Synchronise to make sure the tile 
        // is loaded from shared to registers
        //barrier(CLK_LOCAL_MEM_FENCE);

        // col 0
        regC[0*8 + 0] += regA[0]* regB[0];
        regC[0*8 + 1] += regA[1]* regB[0];
        regC[0*8 + 2] += regA[2]* regB[0];
        regC[0*8 + 3] += regA[3]* regB[0];
        regC[0*8 + 4] += regA[4]* regB[0];
        regC[0*8 + 5] += regA[5]* regB[0];
        regC[0*8 + 6] += regA[6]* regB[0];
        regC[0*8 + 7] += regA[7]* regB[0];

        // col 1 
        regC[1*8 + 0] += regA[0]* regB[1];
        regC[1*8 + 1] += regA[1]* regB[1];
        regC[1*8 + 2] += regA[2]* regB[1];
        regC[1*8 + 3] += regA[3]* regB[1];
        regC[1*8 + 4] += regA[4]* regB[1];
        regC[1*8 + 5] += regA[5]* regB[1];
        regC[1*8 + 6] += regA[6]* regB[1];
        regC[1*8 + 7] += regA[7]* regB[1];

        // col 2
        regC[2*8 + 0] += regA[0]* regB[2];
        regC[2*8 + 1] += regA[1]* regB[2];
        regC[2*8 + 2] += regA[2]* regB[2];
        regC[2*8 + 3] += regA[3]* regB[2];
        regC[2*8 + 4] += regA[4]* regB[2];
        regC[2*8 + 5] += regA[5]* regB[2];
        regC[2*8 + 6] += regA[6]* regB[2];
        regC[2*8 + 7] += regA[7]* regB[2];

        // col 3
        regC[3*8 + 0] += regA[0]* regB[3];
        regC[3*8 + 1] += regA[1]* regB[3];
        regC[3*8 + 2] += regA[2]* regB[3];
        regC[3*8 + 3] += regA[3]* regB[3];
        regC[3*8 + 4] += regA[4]* regB[3];
        regC[3*8 + 5] += regA[5]* regB[3];
        regC[3*8 + 6] += regA[6]* regB[3];
        regC[3*8 + 7] += regA[7]* regB[3];

        // col 4
        regC[4*8 + 0] += regA[0]* regB[4];
        regC[4*8 + 1] += regA[1]* regB[4];
        regC[4*8 + 2] += regA[2]* regB[4];
        regC[4*8 + 3] += regA[3]* regB[4];
        regC[4*8 + 4] += regA[4]* regB[4];
        regC[4*8 + 5] += regA[5]* regB[4];
        regC[4*8 + 6] += regA[6]* regB[4];
        regC[4*8 + 7] += regA[7]* regB[4];

        // col 5
        regC[5*8 + 0] += regA[0]* regB[5];
        regC[5*8 + 1] += regA[1]* regB[5];
        regC[5*8 + 2] += regA[2]* regB[5];
        regC[5*8 + 3] += regA[3]* regB[5];
        regC[5*8 + 4] += regA[4]* regB[5];
        regC[5*8 + 5] += regA[5]* regB[5];
        regC[5*8 + 6] += regA[6]* regB[5];
        regC[5*8 + 7] += regA[7]* regB[5];

        // col 6
        regC[6*8 + 0] += regA[0]* regB[6];
        regC[6*8 + 1] += regA[1]* regB[6];
        regC[6*8 + 2] += regA[2]* regB[6];
        regC[6*8 + 3] += regA[3]* regB[6];
        regC[6*8 + 4] += regA[4]* regB[6];
        regC[6*8 + 5] += regA[5]* regB[6];
        regC[6*8 + 6] += regA[6]* regB[6];
        regC[6*8 + 7] += regA[7]* regB[6];

        // col 7
        regC[7*8 + 0] += regA[0]* regB[7];
        regC[7*8 + 1] += regA[1]* regB[7];
        regC[7*8 + 2] += regA[2]* regB[7];
        regC[7*8 + 3] += regA[3]* regB[7];
        regC[7*8 + 4] += regA[4]* regB[7];
        regC[7*8 + 5] += regA[5]* regB[7];
        regC[7*8 + 6] += regA[6]* regB[7];
        regC[7*8 + 7] += regA[7]* regB[7];


        // unroll 5 
        // load A, B from shared memory to registers and compute C
        regA[0] = tileA[swap_index + 5*tile_dim_x + local_thread_id_x*8 + 0];
        regA[1] = tileA[swap_index + 5*tile_dim_x + local_thread_id_x*8 + 1];
        regA[2] = tileA[swap_index + 5*tile_dim_x + local_thread_id_x*8 + 2];
        regA[3] = tileA[swap_index + 5*tile_dim_x + local_thread_id_x*8 + 3];
        regA[4] = tileA[swap_index + 5*tile_dim_x + local_thread_id_x*8 + 4];
        regA[5] = tileA[swap_index + 5*tile_dim_x + local_thread_id_x*8 + 5];
        regA[6] = tileA[swap_index + 5*tile_dim_x + local_thread_id_x*8 + 6];
        regA[7] = tileA[swap_index + 5*tile_dim_x + local_thread_id_x*8 + 7];


        regB[0] = tileB[swap_index + 5*tile_dim_y + local_thread_id_y*8 + 0];
        regB[1] = tileB[swap_index + 5*tile_dim_y + local_thread_id_y*8 + 1];
        regB[2] = tileB[swap_index + 5*tile_dim_y + local_thread_id_y*8 + 2];
        regB[3] = tileB[swap_index + 5*tile_dim_y + local_thread_id_y*8 + 3];
        regB[4] = tileB[swap_index + 5*tile_dim_y + local_thread_id_y*8 + 4];
        regB[5] = tileB[swap_index + 5*tile_dim_y + local_thread_id_y*8 + 5];
        regB[6] = tileB[swap_index + 5*tile_dim_y + local_thread_id_y*8 + 6];
        regB[7] = tileB[swap_index + 5*tile_dim_y + local_thread_id_y*8 + 7];

        // Synchronise to make sure the tile 
        // is loaded from shared to registers
        //barrier(CLK_LOCAL_MEM_FENCE);

        // col 0
        regC[0*8 + 0] += regA[0]* regB[0];
        regC[0*8 + 1] += regA[1]* regB[0];
        regC[0*8 + 2] += regA[2]* regB[0];
        regC[0*8 + 3] += regA[3]* regB[0];
        regC[0*8 + 4] += regA[4]* regB[0];
        regC[0*8 + 5] += regA[5]* regB[0];
        regC[0*8 + 6] += regA[6]* regB[0];
        regC[0*8 + 7] += regA[7]* regB[0];

        // col 1 
        regC[1*8 + 0] += regA[0]* regB[1];
        regC[1*8 + 1] += regA[1]* regB[1];
        regC[1*8 + 2] += regA[2]* regB[1];
        regC[1*8 + 3] += regA[3]* regB[1];
        regC[1*8 + 4] += regA[4]* regB[1];
        regC[1*8 + 5] += regA[5]* regB[1];
        regC[1*8 + 6] += regA[6]* regB[1];
        regC[1*8 + 7] += regA[7]* regB[1];

        // col 2
        regC[2*8 + 0] += regA[0]* regB[2];
        regC[2*8 + 1] += regA[1]* regB[2];
        regC[2*8 + 2] += regA[2]* regB[2];
        regC[2*8 + 3] += regA[3]* regB[2];
        regC[2*8 + 4] += regA[4]* regB[2];
        regC[2*8 + 5] += regA[5]* regB[2];
        regC[2*8 + 6] += regA[6]* regB[2];
        regC[2*8 + 7] += regA[7]* regB[2];

        // col 3
        regC[3*8 + 0] += regA[0]* regB[3];
        regC[3*8 + 1] += regA[1]* regB[3];
        regC[3*8 + 2] += regA[2]* regB[3];
        regC[3*8 + 3] += regA[3]* regB[3];
        regC[3*8 + 4] += regA[4]* regB[3];
        regC[3*8 + 5] += regA[5]* regB[3];
        regC[3*8 + 6] += regA[6]* regB[3];
        regC[3*8 + 7] += regA[7]* regB[3];

        // col 4
        regC[4*8 + 0] += regA[0]* regB[4];
        regC[4*8 + 1] += regA[1]* regB[4];
        regC[4*8 + 2] += regA[2]* regB[4];
        regC[4*8 + 3] += regA[3]* regB[4];
        regC[4*8 + 4] += regA[4]* regB[4];
        regC[4*8 + 5] += regA[5]* regB[4];
        regC[4*8 + 6] += regA[6]* regB[4];
        regC[4*8 + 7] += regA[7]* regB[4];

        // col 5
        regC[5*8 + 0] += regA[0]* regB[5];
        regC[5*8 + 1] += regA[1]* regB[5];
        regC[5*8 + 2] += regA[2]* regB[5];
        regC[5*8 + 3] += regA[3]* regB[5];
        regC[5*8 + 4] += regA[4]* regB[5];
        regC[5*8 + 5] += regA[5]* regB[5];
        regC[5*8 + 6] += regA[6]* regB[5];
        regC[5*8 + 7] += regA[7]* regB[5];

        // col 6
        regC[6*8 + 0] += regA[0]* regB[6];
        regC[6*8 + 1] += regA[1]* regB[6];
        regC[6*8 + 2] += regA[2]* regB[6];
        regC[6*8 + 3] += regA[3]* regB[6];
        regC[6*8 + 4] += regA[4]* regB[6];
        regC[6*8 + 5] += regA[5]* regB[6];
        regC[6*8 + 6] += regA[6]* regB[6];
        regC[6*8 + 7] += regA[7]* regB[6];

        // col 7
        regC[7*8 + 0] += regA[0]* regB[7];
        regC[7*8 + 1] += regA[1]* regB[7];
        regC[7*8 + 2] += regA[2]* regB[7];
        regC[7*8 + 3] += regA[3]* regB[7];
        regC[7*8 + 4] += regA[4]* regB[7];
        regC[7*8 + 5] += regA[5]* regB[7];
        regC[7*8 + 6] += regA[6]* regB[7];
        regC[7*8 + 7] += regA[7]* regB[7];



        // unroll 6 
        // load A, B from shared memory to registers and compute C
        regA[0] = tileA[swap_index + 6*tile_dim_x + local_thread_id_x*8 + 0];
        regA[1] = tileA[swap_index + 6*tile_dim_x + local_thread_id_x*8 + 1];
        regA[2] = tileA[swap_index + 6*tile_dim_x + local_thread_id_x*8 + 2];
        regA[3] = tileA[swap_index + 6*tile_dim_x + local_thread_id_x*8 + 3];
        regA[4] = tileA[swap_index + 6*tile_dim_x + local_thread_id_x*8 + 4];
        regA[5] = tileA[swap_index + 6*tile_dim_x + local_thread_id_x*8 + 5];
        regA[6] = tileA[swap_index + 6*tile_dim_x + local_thread_id_x*8 + 6];
        regA[7] = tileA[swap_index + 6*tile_dim_x + local_thread_id_x*8 + 7];


        regB[0] = tileB[swap_index + 6*tile_dim_y + local_thread_id_y*8 + 0];
        regB[1] = tileB[swap_index + 6*tile_dim_y + local_thread_id_y*8 + 1];
        regB[2] = tileB[swap_index + 6*tile_dim_y + local_thread_id_y*8 + 2];
        regB[3] = tileB[swap_index + 6*tile_dim_y + local_thread_id_y*8 + 3];
        regB[4] = tileB[swap_index + 6*tile_dim_y + local_thread_id_y*8 + 4];
        regB[5] = tileB[swap_index + 6*tile_dim_y + local_thread_id_y*8 + 5];
        regB[6] = tileB[swap_index + 6*tile_dim_y + local_thread_id_y*8 + 6];
        regB[7] = tileB[swap_index + 6*tile_dim_y + local_thread_id_y*8 + 7];

        // Synchronise to make sure the tile 
        // is loaded from shared to registers
        //barrier(CLK_LOCAL_MEM_FENCE);

        // col 0
        regC[0*8 + 0] += regA[0]* regB[0];
        regC[0*8 + 1] += regA[1]* regB[0];
        regC[0*8 + 2] += regA[2]* regB[0];
        regC[0*8 + 3] += regA[3]* regB[0];
        regC[0*8 + 4] += regA[4]* regB[0];
        regC[0*8 + 5] += regA[5]* regB[0];
        regC[0*8 + 6] += regA[6]* regB[0];
        regC[0*8 + 7] += regA[7]* regB[0];

        // col 1 
        regC[1*8 + 0] += regA[0]* regB[1];
        regC[1*8 + 1] += regA[1]* regB[1];
        regC[1*8 + 2] += regA[2]* regB[1];
        regC[1*8 + 3] += regA[3]* regB[1];
        regC[1*8 + 4] += regA[4]* regB[1];
        regC[1*8 + 5] += regA[5]* regB[1];
        regC[1*8 + 6] += regA[6]* regB[1];
        regC[1*8 + 7] += regA[7]* regB[1];

        // col 2
        regC[2*8 + 0] += regA[0]* regB[2];
        regC[2*8 + 1] += regA[1]* regB[2];
        regC[2*8 + 2] += regA[2]* regB[2];
        regC[2*8 + 3] += regA[3]* regB[2];
        regC[2*8 + 4] += regA[4]* regB[2];
        regC[2*8 + 5] += regA[5]* regB[2];
        regC[2*8 + 6] += regA[6]* regB[2];
        regC[2*8 + 7] += regA[7]* regB[2];

        // col 3
        regC[3*8 + 0] += regA[0]* regB[3];
        regC[3*8 + 1] += regA[1]* regB[3];
        regC[3*8 + 2] += regA[2]* regB[3];
        regC[3*8 + 3] += regA[3]* regB[3];
        regC[3*8 + 4] += regA[4]* regB[3];
        regC[3*8 + 5] += regA[5]* regB[3];
        regC[3*8 + 6] += regA[6]* regB[3];
        regC[3*8 + 7] += regA[7]* regB[3];

        // col 4
        regC[4*8 + 0] += regA[0]* regB[4];
        regC[4*8 + 1] += regA[1]* regB[4];
        regC[4*8 + 2] += regA[2]* regB[4];
        regC[4*8 + 3] += regA[3]* regB[4];
        regC[4*8 + 4] += regA[4]* regB[4];
        regC[4*8 + 5] += regA[5]* regB[4];
        regC[4*8 + 6] += regA[6]* regB[4];
        regC[4*8 + 7] += regA[7]* regB[4];

        // col 5
        regC[5*8 + 0] += regA[0]* regB[5];
        regC[5*8 + 1] += regA[1]* regB[5];
        regC[5*8 + 2] += regA[2]* regB[5];
        regC[5*8 + 3] += regA[3]* regB[5];
        regC[5*8 + 4] += regA[4]* regB[5];
        regC[5*8 + 5] += regA[5]* regB[5];
        regC[5*8 + 6] += regA[6]* regB[5];
        regC[5*8 + 7] += regA[7]* regB[5];

        // col 6
        regC[6*8 + 0] += regA[0]* regB[6];
        regC[6*8 + 1] += regA[1]* regB[6];
        regC[6*8 + 2] += regA[2]* regB[6];
        regC[6*8 + 3] += regA[3]* regB[6];
        regC[6*8 + 4] += regA[4]* regB[6];
        regC[6*8 + 5] += regA[5]* regB[6];
        regC[6*8 + 6] += regA[6]* regB[6];
        regC[6*8 + 7] += regA[7]* regB[6];

        // col 7
        regC[7*8 + 0] += regA[0]* regB[7];
        regC[7*8 + 1] += regA[1]* regB[7];
        regC[7*8 + 2] += regA[2]* regB[7];
        regC[7*8 + 3] += regA[3]* regB[7];
        regC[7*8 + 4] += regA[4]* regB[7];
        regC[7*8 + 5] += regA[5]* regB[7];
        regC[7*8 + 6] += regA[6]* regB[7];
        regC[7*8 + 7] += regA[7]* regB[7];

        // unroll 7 
        // load A, B from shared memory to registers and compute C
        regA[0] = tileA[swap_index + 7*tile_dim_x + local_thread_id_x*8 + 0];
        regA[1] = tileA[swap_index + 7*tile_dim_x + local_thread_id_x*8 + 1];
        regA[2] = tileA[swap_index + 7*tile_dim_x + local_thread_id_x*8 + 2];
        regA[3] = tileA[swap_index + 7*tile_dim_x + local_thread_id_x*8 + 3];
        regA[4] = tileA[swap_index + 7*tile_dim_x + local_thread_id_x*8 + 4];
        regA[5] = tileA[swap_index + 7*tile_dim_x + local_thread_id_x*8 + 5];
        regA[6] = tileA[swap_index + 7*tile_dim_x + local_thread_id_x*8 + 6];
        regA[7] = tileA[swap_index + 7*tile_dim_x + local_thread_id_x*8 + 7];


        regB[0] = tileB[swap_index + 7*tile_dim_y + local_thread_id_y*8 + 0];
        regB[1] = tileB[swap_index + 7*tile_dim_y + local_thread_id_y*8 + 1];
        regB[2] = tileB[swap_index + 7*tile_dim_y + local_thread_id_y*8 + 2];
        regB[3] = tileB[swap_index + 7*tile_dim_y + local_thread_id_y*8 + 3];
        regB[4] = tileB[swap_index + 7*tile_dim_y + local_thread_id_y*8 + 4];
        regB[5] = tileB[swap_index + 7*tile_dim_y + local_thread_id_y*8 + 5];
        regB[6] = tileB[swap_index + 7*tile_dim_y + local_thread_id_y*8 + 6];
        regB[7] = tileB[swap_index + 7*tile_dim_y + local_thread_id_y*8 + 7];

        // Synchronise to make sure the tile 
        // is loaded from shared to registers
        //barrier(CLK_LOCAL_MEM_FENCE);

        // col 0
        regC[0*8 + 0] += regA[0]* regB[0];
        regC[0*8 + 1] += regA[1]* regB[0];
        regC[0*8 + 2] += regA[2]* regB[0];
        regC[0*8 + 3] += regA[3]* regB[0];
        regC[0*8 + 4] += regA[4]* regB[0];
        regC[0*8 + 5] += regA[5]* regB[0];
        regC[0*8 + 6] += regA[6]* regB[0];
        regC[0*8 + 7] += regA[7]* regB[0];

        // col 1 
        regC[1*8 + 0] += regA[0]* regB[1];
        regC[1*8 + 1] += regA[1]* regB[1];
        regC[1*8 + 2] += regA[2]* regB[1];
        regC[1*8 + 3] += regA[3]* regB[1];
        regC[1*8 + 4] += regA[4]* regB[1];
        regC[1*8 + 5] += regA[5]* regB[1];
        regC[1*8 + 6] += regA[6]* regB[1];
        regC[1*8 + 7] += regA[7]* regB[1];

        // col 2
        regC[2*8 + 0] += regA[0]* regB[2];
        regC[2*8 + 1] += regA[1]* regB[2];
        regC[2*8 + 2] += regA[2]* regB[2];
        regC[2*8 + 3] += regA[3]* regB[2];
        regC[2*8 + 4] += regA[4]* regB[2];
        regC[2*8 + 5] += regA[5]* regB[2];
        regC[2*8 + 6] += regA[6]* regB[2];
        regC[2*8 + 7] += regA[7]* regB[2];

        // col 3
        regC[3*8 + 0] += regA[0]* regB[3];
        regC[3*8 + 1] += regA[1]* regB[3];
        regC[3*8 + 2] += regA[2]* regB[3];
        regC[3*8 + 3] += regA[3]* regB[3];
        regC[3*8 + 4] += regA[4]* regB[3];
        regC[3*8 + 5] += regA[5]* regB[3];
        regC[3*8 + 6] += regA[6]* regB[3];
        regC[3*8 + 7] += regA[7]* regB[3];

        // col 4
        regC[4*8 + 0] += regA[0]* regB[4];
        regC[4*8 + 1] += regA[1]* regB[4];
        regC[4*8 + 2] += regA[2]* regB[4];
        regC[4*8 + 3] += regA[3]* regB[4];
        regC[4*8 + 4] += regA[4]* regB[4];
        regC[4*8 + 5] += regA[5]* regB[4];
        regC[4*8 + 6] += regA[6]* regB[4];
        regC[4*8 + 7] += regA[7]* regB[4];

        // col 5
        regC[5*8 + 0] += regA[0]* regB[5];
        regC[5*8 + 1] += regA[1]* regB[5];
        regC[5*8 + 2] += regA[2]* regB[5];
        regC[5*8 + 3] += regA[3]* regB[5];
        regC[5*8 + 4] += regA[4]* regB[5];
        regC[5*8 + 5] += regA[5]* regB[5];
        regC[5*8 + 6] += regA[6]* regB[5];
        regC[5*8 + 7] += regA[7]* regB[5];

        // col 6
        regC[6*8 + 0] += regA[0]* regB[6];
        regC[6*8 + 1] += regA[1]* regB[6];
        regC[6*8 + 2] += regA[2]* regB[6];
        regC[6*8 + 3] += regA[3]* regB[6];
        regC[6*8 + 4] += regA[4]* regB[6];
        regC[6*8 + 5] += regA[5]* regB[6];
        regC[6*8 + 6] += regA[6]* regB[6];
        regC[6*8 + 7] += regA[7]* regB[6];

        // col 7
        regC[7*8 + 0] += regA[0]* regB[7];
        regC[7*8 + 1] += regA[1]* regB[7];
        regC[7*8 + 2] += regA[2]* regB[7];
        regC[7*8 + 3] += regA[3]* regB[7];
        regC[7*8 + 4] += regA[4]* regB[7];
        regC[7*8 + 5] += regA[5]* regB[7];
        regC[7*8 + 6] += regA[6]* regB[7];
        regC[7*8 + 7] += regA[7]* regB[7];


        // swap
        swap_index = (swap_index + 512)%1024;

        // Synchronise to make sure the shared memory used 
        barrier(CLK_LOCAL_MEM_FENCE);
    }

    // write C

    // col 0 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[0*8 + 0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[0*8 + 1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[0*8 + 2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[0*8 + 3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[0*8 + 4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[0*8 + 5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[0*8 + 6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[0*8 + 7];

    // col 1 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[1*8 + 0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[1*8 + 1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[1*8 + 2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[1*8 + 3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[1*8 + 4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[1*8 + 5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[1*8 + 6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[1*8 + 7];

    // col 2 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[2*8 + 0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[2*8 + 1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[2*8 + 2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[2*8 + 3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[2*8 + 4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[2*8 + 5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[2*8 + 6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[2*8 + 7];

    // col 3 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[3*8 + 0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[3*8 + 1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[3*8 + 2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[3*8 + 3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[3*8 + 4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[3*8 + 5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[3*8 + 6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[3*8 + 7];

    // col 4 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[4*8 + 0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[4*8 + 1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[4*8 + 2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[4*8 + 3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[4*8 + 4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[4*8 + 5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[4*8 + 6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[4*8 + 7];

    // col 5 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[5*8 + 0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[5*8 + 1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[5*8 + 2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[5*8 + 3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[5*8 + 4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[5*8 + 5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[5*8 + 6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[5*8 + 7];

    // col 6 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[6*8 + 0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[6*8 + 1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[6*8 + 2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[6*8 + 3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[6*8 + 4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[6*8 + 5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[6*8 + 6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[6*8 + 7];

    // col 7 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[7*8 + 0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[7*8 + 1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[7*8 + 2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[7*8 + 3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[7*8 + 4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[7*8 + 5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[7*8 + 6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[7*8 + 7];
}
