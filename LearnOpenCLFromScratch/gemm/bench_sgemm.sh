for((i=512;i<=8192;i+=512))
do
    #./matmul_c_tile16x16_WPT8 $i $i $i
    ./gemm_block8x8_thread8x8 $i $i $i
done
