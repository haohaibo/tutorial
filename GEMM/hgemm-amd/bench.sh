for ((i=64; i <= 9600 ; i+=64))
do
    ./gemm_test.py -r 10 --arch=gfx803 -m $i -n $i -k $i kernel.o
done

