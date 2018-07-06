
test.hsaco: gemm_block8x8_thread8x8_private_preG_preS.cl
	clang-ocl -save-temps -mcpu=gfx803 -cl-denorms-are-zero $^ -o $@  

clean:
	rm -rf *.hsaco *.i *.bc *.o *.s


