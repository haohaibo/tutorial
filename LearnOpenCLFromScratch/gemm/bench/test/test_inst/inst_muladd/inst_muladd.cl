__kernel void  gemm(
        const __global float *A,
        const __global float *B,
        __global float *C
        )

{


#if 1 
    barrier(CLK_LOCAL_MEM_FENCE);
    barrier(CLK_LOCAL_MEM_FENCE);
    barrier(CLK_LOCAL_MEM_FENCE);
    barrier(CLK_LOCAL_MEM_FENCE);
    barrier(CLK_LOCAL_MEM_FENCE);

    barrier(CLK_LOCAL_MEM_FENCE);
    barrier(CLK_LOCAL_MEM_FENCE);
    barrier(CLK_LOCAL_MEM_FENCE);
    barrier(CLK_LOCAL_MEM_FENCE);
    barrier(CLK_LOCAL_MEM_FENCE);
#endif
    //float regA, regB, regC;
    //regC += regA*regB;

    C[0] += A[0]*B[0];
    C[1] += A[1]*B[1];
}
