__kernel void microbench(
        __global float* in,
        __global float* out,
        int clock){

    __local float shared[6144];
    int tid = get_local_size(0)*get_local_id(1) + get_local_id(0);
    
    //for(int i = 0; i < 6144 - 127; i += 128){
    //    shared[tid + i] = tid + i;
    //}
    __private float sum = 0;
#if 0
    [0, 128, 256, 384, 512, 640, 768, 896, 1024, 1152, 1280, 1408, 1536, 1664, 1792, 1920, 2048, 2176, 2304, 2432, 2560, 2688, 2816, 2944, 
        3072, 3200, 3328, 3456, 3584, 3712, 3840, 3968, 4096, 4224, 4352, 4480, 4608, 4736, 4864, 4992, 5120, 5248, 5376, 5504, 5632, 5760, 588
            8, 6016]
#endif
    //for(int i = 0; i < 6144 - 127; i += 1024){
        sum = sum + shared[tid + 0];
        sum = sum + shared[tid + 128];
        sum = sum + shared[tid + 256];
        sum = sum + shared[tid + 384];
        sum = sum + shared[tid + 512];
        sum = sum + shared[tid + 640];
        sum = sum + shared[tid + 768];
        sum = sum + shared[tid + 896];

        sum = sum + shared[tid + 1024 + 0];
        sum = sum + shared[tid + 1024 + 128];
        sum = sum + shared[tid + 1024 + 256];
        sum = sum + shared[tid + 1024 + 384];
        sum = sum + shared[tid + 1024 + 512];
        sum = sum + shared[tid + 1024 + 640];
        sum = sum + shared[tid + 1024 + 768];
        sum = sum + shared[tid + 1024 + 896];

        sum = sum + shared[tid + 1024 + 1024 + 0];
        sum = sum + shared[tid + 1024 + 1024 + 128];
        sum = sum + shared[tid + 1024 + 1024 + 256];
        sum = sum + shared[tid + 1024 + 1024 + 384];
        sum = sum + shared[tid + 1024 + 1024 + 512];
        sum = sum + shared[tid + 1024 + 1024 + 640];
        sum = sum + shared[tid + 1024 + 1024 + 768];
        sum = sum + shared[tid + 1024 + 1024 + 896];

        sum = sum + shared[tid + 1024 + 1024 + 1024 + 0];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 128];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 256];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 384];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 512];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 640];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 768];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 896];

        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 0];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 128];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 256];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 384];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 512];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 640];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 768];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 896];

        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 1024 + 0];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 1024 + 128];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 1024 + 256];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 1024 + 384];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 1024 + 512];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 1024 + 640];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 1024 + 768];
        sum = sum + shared[tid + 1024 + 1024 + 1024 + 1024 + 1024 + 896];
    //}
    //barrier(CLK_LOCAL_MEM_FENCE);
    out[tid] = sum;
}

