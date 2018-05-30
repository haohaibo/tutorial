__kernel void  gemm(
        const __global float *A,
        const __global float *B,
        __global float *C
        )

{

#if 0
    barrier(CLK_GLOBAL_MEM_FENCE);
    barrier(CLK_GLOBAL_MEM_FENCE);
    barrier(CLK_GLOBAL_MEM_FENCE);
    barrier(CLK_GLOBAL_MEM_FENCE);
    barrier(CLK_GLOBAL_MEM_FENCE);
    barrier(CLK_GLOBAL_MEM_FENCE);
    barrier(CLK_GLOBAL_MEM_FENCE);
    barrier(CLK_GLOBAL_MEM_FENCE);
#endif


    __private float regA[8];
    __private float regB[8];
    __private float regC[64];

    __local float loadA[8];
    __local float loadB[8];

    regA[0] = A[0];
    regA[1] = A[1];
    regA[2] = A[2];
    regA[3] = A[3];
    regA[4] = A[4];
    regA[5] = A[5];
    regA[6] = A[6];
    regA[7] = A[7];

    regA[0] = A[0];
    regA[1] = A[1];
    regA[2] = A[2];
    regA[3] = A[3];
    regA[4] = A[4];
    regA[5] = A[5];
    regA[6] = A[6];
    regA[7] = A[7];
    barrier(CLK_GLOBAL_MEM_FENCE);

    loadA = regA;
    loadB = regB;
    barrier(CLK_LOCAL_MEM_FENCE);

    // compute C
    regC += regA*regB;

    // 写回
    C[0] = regC;
}
