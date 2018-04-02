for((i=512;i<=8192;i+=512))
do
    ./matmul_c_v1 $i $i $i
done
