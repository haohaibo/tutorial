ifndef CC
	CC=gcc
endif


CCFLAGS=-std=c99 -L/opt/rocm/opencl/lib/x86_64
LIBS=-lOpenCL
COMM_DIR=../c_comm
WORRING=-Wno-deprecated-declarations

.PHONY: all

all: vadd_c vadd_cpu

vadd_c: vadd_c.c
	$(CC) $^ $(CCFLAGS) $(LIBS) $(WORRING) -I $(COMM_DIR) -o $@

vadd_cpu: vadd_cpu.c
	$(CC) $^ -o $@

clean:
	rm -rf vadd_c vadd_cpu
