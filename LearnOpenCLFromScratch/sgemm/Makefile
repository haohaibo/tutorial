ifndef CC
	CC=gcc
endif


CCFLAGS=-std=c99 -L/opt/rocm/opencl/lib/x86_64
LIBS=-lOpenCL
COMM_DIR=../c_comm
WARNING=-Wno-deprecated-declarations

.PHONY: all

all: matmul_c_v1 matmul_c_v2

matmul_c_v1: matmul_c_v1.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WARNING) -I $(COMM_DIR) -o $@

matmul_c_v2: matmul_c_v2.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WARNING) -I $(COMM_DIR) -o $@

clean:
	rm -rf matmul_c_v1 matmul_c_v2
