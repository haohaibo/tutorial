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
    int global_thread_id_x = 
        get_group_id(0)*get_local_size(0) 
        + get_local_id(0);
    int global_thread_id_y = 
        get_group_id(1)*get_local_size(1) 
        + get_local_id(1);

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
    __local float tileA[64 * 8];
    __local float tileA_bak[64 * 8];
    __local float tileB[64 * 8];
    __local float tileB_bak[64 * 8];
    //__local float tileC[tile_dim_x * tile_dim_y];

    // for global -> register loadA, loadB
    __private float loadA[8];
    __private float loadB[8];

    // registers for shared memory double buffer

    // registers for float-multiply-add 
    //float regA[thread_task_x], regB[thread_task_y];
    //float regA_bak[thread_task_x], regB_bak[thread_task_y];
    //float regC[thread_task_y][thread_task_x];
    __private float regA[8], regB[8];
    __private float regA_bak[8], regB_bak[8];
    __private float regC[8][8];


    // clear regC
    for(int i = 0; i < thread_task_y; ++i){
        for(int j = 0; j < thread_task_x; ++j){
            regC[i][j] = 0;
        }
    }

    // (64tile_dim*8unroll)/(8*8 threads) = 8
    for(int t = 0; t < 8; ++t){
        loadA[t] = 
            A[(0*NUM_UNROLL + local_thread_id_y)*M + 
            block_id_x*tile_dim_x + local_thread_id_x*8 + t];

        loadB[t] = 
            B[(block_id_y*tile_dim_y + local_thread_id)*K + 
            0*NUM_UNROLL + t];


        //tileA[local_thread_id_y*64 + local_thread_id_x*8 + t] = loadA[t];
        //tileB[local_thread_id + t*tile_dim_y] = loadB[t];
    }
    // Synchronise to make sure the tile is loaded
    //barrier(CLK_LOCAL_MEM_FENCE);
    barrier(CLK_GLOBAL_MEM_FENCE);

    for(int i = 0; i < K/NUM_UNROLL; ++i){

        // load tile of A, B from global to shared memory
        // load 64*8 of A's, 64*8 of B's
        // (64tile_dim*8unroll)/(8*8 threads) = 8
        // *shared memory double buffer*
        if(i % 2 == 0){

            for(int t = 0; t < 8; ++t){
                tileA[local_thread_id_y*64 + local_thread_id_x*8 + t] = loadA[t];
                tileB[local_thread_id + t*tile_dim_y] = loadB[t];
            }
            barrier(CLK_LOCAL_MEM_FENCE);

            if( i != (K/NUM_UNROLL -1)){
                for(int t = 0; t < 8; ++t){
                    loadA[t] = 
                        A[((i+1)*NUM_UNROLL + local_thread_id_y)*M + 
                        block_id_x*tile_dim_x + local_thread_id_x*8 + t];

                    loadB[t] = 
                        B[(block_id_y*tile_dim_y + local_thread_id)*K + 
                        (i+1)*NUM_UNROLL + t];

                }
                barrier(CLK_GLOBAL_MEM_FENCE);
            }

            // Synchronise to make sure the tile is loaded
            //barrier(CLK_LOCAL_MEM_FENCE);
            //barrier(CLK_GLOBAL_MEM_FENCE);


            for(int k = 0; k < NUM_UNROLL; ++k){
                // load A, B from shared memory to registers and compute C
                regA[0] = tileA[k*tile_dim_x + local_thread_id_x*8 + 0];
                regA[1] = tileA[k*tile_dim_x + local_thread_id_x*8 + 1];
                regA[2] = tileA[k*tile_dim_x + local_thread_id_x*8 + 2];
                regA[3] = tileA[k*tile_dim_x + local_thread_id_x*8 + 3];
                regA[4] = tileA[k*tile_dim_x + local_thread_id_x*8 + 4];
                regA[5] = tileA[k*tile_dim_x + local_thread_id_x*8 + 5];
                regA[6] = tileA[k*tile_dim_x + local_thread_id_x*8 + 6];
                regA[7] = tileA[k*tile_dim_x + local_thread_id_x*8 + 7];


                regB[0] = tileB[k*tile_dim_y + local_thread_id_y*8 + 0];
                regB[1] = tileB[k*tile_dim_y + local_thread_id_y*8 + 1];
                regB[2] = tileB[k*tile_dim_y + local_thread_id_y*8 + 2];
                regB[3] = tileB[k*tile_dim_y + local_thread_id_y*8 + 3];
                regB[4] = tileB[k*tile_dim_y + local_thread_id_y*8 + 4];
                regB[5] = tileB[k*tile_dim_y + local_thread_id_y*8 + 5];
                regB[6] = tileB[k*tile_dim_y + local_thread_id_y*8 + 6];
                regB[7] = tileB[k*tile_dim_y + local_thread_id_y*8 + 7];

                // Synchronise to make sure the tile 
                // is loaded from shared to registers
                //barrier(CLK_LOCAL_MEM_FENCE);

                regC[0][0] += regA[0]* regB[0];
                regC[0][1] += regA[0]* regB[1];
                regC[0][2] += regA[0]* regB[2];
                regC[0][3] += regA[0]* regB[3];
                regC[0][4] += regA[0]* regB[4];
                regC[0][5] += regA[0]* regB[5];
                regC[0][6] += regA[0]* regB[6];
                regC[0][7] += regA[0]* regB[7];

                regC[1][0] += regA[1]* regB[0];
                regC[1][1] += regA[1]* regB[1];
                regC[1][2] += regA[1]* regB[2];
                regC[1][3] += regA[1]* regB[3];
                regC[1][4] += regA[1]* regB[4];
                regC[1][5] += regA[1]* regB[5];
                regC[1][6] += regA[1]* regB[6];
                regC[1][7] += regA[1]* regB[7];

                regC[2][0] += regA[2]* regB[0];
                regC[2][1] += regA[2]* regB[1];
                regC[2][2] += regA[2]* regB[2];
                regC[2][3] += regA[2]* regB[3];
                regC[2][4] += regA[2]* regB[4];
                regC[2][5] += regA[2]* regB[5];
                regC[2][6] += regA[2]* regB[6];
                regC[2][7] += regA[2]* regB[7];

                regC[3][0] += regA[3]* regB[0];
                regC[3][1] += regA[3]* regB[1];
                regC[3][2] += regA[3]* regB[2];
                regC[3][3] += regA[3]* regB[3];
                regC[3][4] += regA[3]* regB[4];
                regC[3][5] += regA[3]* regB[5];
                regC[3][6] += regA[3]* regB[6];
                regC[3][7] += regA[3]* regB[7];

                regC[4][0] += regA[4]* regB[0];
                regC[4][1] += regA[4]* regB[1];
                regC[4][2] += regA[4]* regB[2];
                regC[4][3] += regA[4]* regB[3];
                regC[4][4] += regA[4]* regB[4];
                regC[4][5] += regA[4]* regB[5];
                regC[4][6] += regA[4]* regB[6];
                regC[4][7] += regA[4]* regB[7];

                regC[5][0] += regA[5]* regB[0];
                regC[5][1] += regA[5]* regB[1];
                regC[5][2] += regA[5]* regB[2];
                regC[5][3] += regA[5]* regB[3];
                regC[5][4] += regA[5]* regB[4];
                regC[5][5] += regA[5]* regB[5];
                regC[5][6] += regA[5]* regB[6];
                regC[5][7] += regA[5]* regB[7];

                regC[6][0] += regA[6]* regB[0];
                regC[6][1] += regA[6]* regB[1];
                regC[6][2] += regA[6]* regB[2];
                regC[6][3] += regA[6]* regB[3];
                regC[6][4] += regA[6]* regB[4];
                regC[6][5] += regA[6]* regB[5];
                regC[6][6] += regA[6]* regB[6];
                regC[6][7] += regA[6]* regB[7];

                regC[7][0] += regA[7]* regB[0];
                regC[7][1] += regA[7]* regB[1];
                regC[7][2] += regA[7]* regB[2];
                regC[7][3] += regA[7]* regB[3];
                regC[7][4] += regA[7]* regB[4];
                regC[7][5] += regA[7]* regB[5];
                regC[7][6] += regA[7]* regB[6];
                regC[7][7] += regA[7]* regB[7];

                // Synchronise before loading 
                // the next tile of A, B to registers 
                //barrier(CLK_LOCAL_MEM_FENCE);
            }
        }else{

            for(int t = 0; t < 8; ++t){
                tileA_bak[local_thread_id_y*64 + local_thread_id_x*8 + t] = loadA[t];
                tileB_bak[local_thread_id + t*tile_dim_y] = loadB[t];
            }
            barrier(CLK_LOCAL_MEM_FENCE);
            
            if(i != (K/NUM_UNROLL -1)){
                for(int t = 0; t < 8; ++t){
                    loadA[t] = 
                        A[((i+1)*NUM_UNROLL + local_thread_id_y)*M + 
                        block_id_x*tile_dim_x + local_thread_id_x*8 + t];

                    loadB[t] = 
                        B[(block_id_y*tile_dim_y + local_thread_id)*K + 
                        (i+1)*NUM_UNROLL + t];

                    //tileA[local_thread_id_y*64 + local_thread_id_x*8 + t] =  loadA[t];
                    //tileB[local_thread_id + t*tile_dim_y] = loadB[t];
                }
                barrier(CLK_GLOBAL_MEM_FENCE);
            }

            // Synchronise to make sure the tile is loaded
            //barrier(CLK_LOCAL_MEM_FENCE);
            //barrier(CLK_GLOBAL_MEM_FENCE);


            for(int k = 0; k < NUM_UNROLL; ++k){
                // load A, B from shared memory to registers and compute C
                regA[0] = tileA_bak[k*tile_dim_x + local_thread_id_x*8 + 0];
                regA[1] = tileA_bak[k*tile_dim_x + local_thread_id_x*8 + 1];
                regA[2] = tileA_bak[k*tile_dim_x + local_thread_id_x*8 + 2];
                regA[3] = tileA_bak[k*tile_dim_x + local_thread_id_x*8 + 3];
                regA[4] = tileA_bak[k*tile_dim_x + local_thread_id_x*8 + 4];
                regA[5] = tileA_bak[k*tile_dim_x + local_thread_id_x*8 + 5];
                regA[6] = tileA_bak[k*tile_dim_x + local_thread_id_x*8 + 6];
                regA[7] = tileA_bak[k*tile_dim_x + local_thread_id_x*8 + 7];


                regB[0] = tileB_bak[k*tile_dim_y + local_thread_id_y*8 + 0];
                regB[1] = tileB_bak[k*tile_dim_y + local_thread_id_y*8 + 1];
                regB[2] = tileB_bak[k*tile_dim_y + local_thread_id_y*8 + 2];
                regB[3] = tileB_bak[k*tile_dim_y + local_thread_id_y*8 + 3];
                regB[4] = tileB_bak[k*tile_dim_y + local_thread_id_y*8 + 4];
                regB[5] = tileB_bak[k*tile_dim_y + local_thread_id_y*8 + 5];
                regB[6] = tileB_bak[k*tile_dim_y + local_thread_id_y*8 + 6];
                regB[7] = tileB_bak[k*tile_dim_y + local_thread_id_y*8 + 7];

                // Synchronise to make sure the tile 
                // is loaded from shared to registers
                //barrier(CLK_LOCAL_MEM_FENCE);

                regC[0][0] += regA[0]* regB[0];
                regC[0][1] += regA[0]* regB[1];
                regC[0][2] += regA[0]* regB[2];
                regC[0][3] += regA[0]* regB[3];
                regC[0][4] += regA[0]* regB[4];
                regC[0][5] += regA[0]* regB[5];
                regC[0][6] += regA[0]* regB[6];
                regC[0][7] += regA[0]* regB[7];

                regC[1][0] += regA[1]* regB[0];
                regC[1][1] += regA[1]* regB[1];
                regC[1][2] += regA[1]* regB[2];
                regC[1][3] += regA[1]* regB[3];
                regC[1][4] += regA[1]* regB[4];
                regC[1][5] += regA[1]* regB[5];
                regC[1][6] += regA[1]* regB[6];
                regC[1][7] += regA[1]* regB[7];

                regC[2][0] += regA[2]* regB[0];
                regC[2][1] += regA[2]* regB[1];
                regC[2][2] += regA[2]* regB[2];
                regC[2][3] += regA[2]* regB[3];
                regC[2][4] += regA[2]* regB[4];
                regC[2][5] += regA[2]* regB[5];
                regC[2][6] += regA[2]* regB[6];
                regC[2][7] += regA[2]* regB[7];

                regC[3][0] += regA[3]* regB[0];
                regC[3][1] += regA[3]* regB[1];
                regC[3][2] += regA[3]* regB[2];
                regC[3][3] += regA[3]* regB[3];
                regC[3][4] += regA[3]* regB[4];
                regC[3][5] += regA[3]* regB[5];
                regC[3][6] += regA[3]* regB[6];
                regC[3][7] += regA[3]* regB[7];

                regC[4][0] += regA[4]* regB[0];
                regC[4][1] += regA[4]* regB[1];
                regC[4][2] += regA[4]* regB[2];
                regC[4][3] += regA[4]* regB[3];
                regC[4][4] += regA[4]* regB[4];
                regC[4][5] += regA[4]* regB[5];
                regC[4][6] += regA[4]* regB[6];
                regC[4][7] += regA[4]* regB[7];

                regC[5][0] += regA[5]* regB[0];
                regC[5][1] += regA[5]* regB[1];
                regC[5][2] += regA[5]* regB[2];
                regC[5][3] += regA[5]* regB[3];
                regC[5][4] += regA[5]* regB[4];
                regC[5][5] += regA[5]* regB[5];
                regC[5][6] += regA[5]* regB[6];
                regC[5][7] += regA[5]* regB[7];

                regC[6][0] += regA[6]* regB[0];
                regC[6][1] += regA[6]* regB[1];
                regC[6][2] += regA[6]* regB[2];
                regC[6][3] += regA[6]* regB[3];
                regC[6][4] += regA[6]* regB[4];
                regC[6][5] += regA[6]* regB[5];
                regC[6][6] += regA[6]* regB[6];
                regC[6][7] += regA[6]* regB[7];

                regC[7][0] += regA[7]* regB[0];
                regC[7][1] += regA[7]* regB[1];
                regC[7][2] += regA[7]* regB[2];
                regC[7][3] += regA[7]* regB[3];
                regC[7][4] += regA[7]* regB[4];
                regC[7][5] += regA[7]* regB[5];
                regC[7][6] += regA[7]* regB[6];
                regC[7][7] += regA[7]* regB[7];

                // Synchronise before loading 
                // the next tile of A, B to registers 
                //barrier(CLK_LOCAL_MEM_FENCE);
            }
        }

        // Synchronise to make sure the shared memory used 
        barrier(CLK_LOCAL_MEM_FENCE);
    }

    // write C

    // col 0 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[0][0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[1][0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[2][0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[3][0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[4][0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[5][0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[6][0];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 0)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[7][0];

    // col 1 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[0][1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[1][1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[2][1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[3][1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[4][1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[5][1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[6][1];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 1)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[7][1];

    // col 2 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[0][2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[1][2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[2][2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[3][2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[4][2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[5][2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[6][2];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 2)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[7][2];

    // col 3 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[0][3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[1][3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[2][3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[3][3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[4][3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[5][3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[6][3];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 3)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[7][3];

    // col 4 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[0][4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[1][4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[2][4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[3][4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[4][4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[5][4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[6][4];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 4)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[7][4];

    // col 5 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[0][5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[1][5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[2][5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[3][5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[4][5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[5][5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[6][5];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 5)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[7][5];

    // col 6 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[0][6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[1][6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[2][6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[3][6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[4][6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[5][6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[6][6];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 6)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[7][6];

    // col 7 
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 0] = 
        regC[0][7];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 1] = 
        regC[1][7];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 2] = 
        regC[2][7];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 3] = 
        regC[3][7];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 4] = 
        regC[4][7];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 5] = 
        regC[5][7];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 6] = 
        regC[6][7];
    C[(block_id_y*tile_dim_y + local_thread_id_y*thread_task_y + 7)*M + 
        block_id_x*tile_dim_x + local_thread_id_x*thread_task_x + 7] = 
        regC[7][7];
}
