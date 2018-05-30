__kernel void microbench(
        __global float* in,
        __global float* out,
        int clock){

    __local float shared[6144];
    int tid = get_local_size(0)*get_local_id(1) + get_local_id(0);
    
    for(int i = 0; i < 6144 - 127; i += 128){
        shared[tid + i] = tid + i;
    }
    int sum = 0;
    for(int i = 0; i < 6144 - 127; i += 128){
        sum += shared[tid + i];
    }
    //barrier(CLK_LOCAL_MEM_FENCE);
    //out[tid] = sum;
}

