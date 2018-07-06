for((i=512;i<=8192;i+=512))
do
    ./matmul_c_v2 $i $i $i
done
