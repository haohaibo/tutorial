代码来源:
https://www.codeproject.com/Articles/874396/Crunching-Numbers-with-AVX-and-AVX

编译:
gcc -mavx -o hello_avx hello_avx.c
gcc -mavx2 -o mask_load mask_load.c
gcc -mfma -o fmatest fmatest.c
gcc -mavx -o complex_mult complex_mult.c
