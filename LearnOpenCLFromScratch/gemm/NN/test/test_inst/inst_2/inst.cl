__kernel void  gemm(){

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
}
