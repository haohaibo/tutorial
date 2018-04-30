ifndef CC
	CC=gcc
endif


CCFLAGS=-std=c99 -L/opt/rocm/opencl/lib/x86_64
LIBS=-lOpenCL
COMM_DIR=../c_comm
WARNING=-Wno-deprecated-declarations

.PHONY: all

all: matmul_c_orignal matmul_c_tile16x16 matmul_c_tile16x16_WPT8 \
	matmul_c_tile16x16_WPT4 matmul_c_tile16x16_WPT2

matmul_c_orignal: matmul_c_orignal.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WARNING) -I $(COMM_DIR) -o $@

matmul_c_tile16x16: matmul_c_tile16x16.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WARNING) -I $(COMM_DIR) -o $@

matmul_c_tile16x16_WPT8: matmul_c_tile16x16_WPT8.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WARNING) -I $(COMM_DIR) -o $@

matmul_c_tile16x16_WPT4: matmul_c_tile16x16_WPT4.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WARNING) -I $(COMM_DIR) -o $@

matmul_c_tile16x16_WPT2: matmul_c_tile16x16_WPT2.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WARNING) -I $(COMM_DIR) -o $@

gemm_block8x8_thread8x8: gemm_block8x8_thread8x8.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WARNING) -I $(COMM_DIR) -o $@

clean:
	rm -rf matmul_c_orignal matmul_c_tile16x16 matmul_c_tile16x16_WPT8 \
		matmul_c_tile16x16_WPT4 matmul_c_tile16x16_WPT2 gemm_block8x8_thread8x8
