ifndef CC
	CC=gcc
endif


CCFLAGS=-std=c99 -L/opt/rocm/opencl/lib/x86_64
LIBS=-lOpenCL
COMM_DIR=../c_comm
WARNING=-Wno-deprecated-declarations

.PHONY: all

all: vadd_c vadd_cpu matmul_c_v1 

matmul_c_v1: matmul_c_v1.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WARNING) -I $(COMM_DIR) -o $@
vadd_c: vadd_c.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WARNING) -I $(COMM_DIR) -o $@

vadd_cpu: vadd_cpu.c
	$(CC) $^ -o $@

clean:
	rm -rf vadd_c vadd_cpu matmul_c_v1
