#for((i=512;i<=8192;i+=512))
for((i=128;i<=8192;i+=128))
#for((i=64;i<=8192;i+=64))
do
    #./matmul_c_tile16x16_WPT8 $i $i $i
    #./gemm_block8x8_thread8x8 $i $i $i
    ./gemm_block8x8_thread8x8_test $i $i $i
    #./matmul_c_orignal $i $i $i
    #./matmul_c_tile16x16 $i $i $i
    #./matmul_c_tile8x8 $i $i $i
done
