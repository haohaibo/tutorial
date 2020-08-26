__kernel __attribute__((reqd_work_group_size(8, 8, 1))) void hgemm_col_nt_64x64_8x8(
		__global const short 	*A,
		__global const short 	*B,
		__global short 	*C,
		const unsigned int lda,
		const unsigned int ldb,
		const unsigned int ldc,
		const unsigned int m,
		const unsigned int n,
		const unsigned int k,
		const short a,
		const short b,
		const int magic,
		const int shift, 
		const unsigned int gnumx,
		const unsigned int gnumy) 
{
    __local short buffer[2048];
    int local_x = get_local_id(0);
    int local_y = get_local_id(1);
    int group_x = get_group_id(0);
    int group_y = get_group_id(1);
    C[gnumx+gnumy] = A[lda+ldb+ldc+m+n+k+magic+shift] + B[local_x+local_y] + buffer[group_x+group_y] + a + b;
}
