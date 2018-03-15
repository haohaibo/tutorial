ifndef CC
	CC = gcc
endif

CCFLAGS=-std=c99 -L/opt/rocm/opencl/lib/x86_64
LIBS = -lOpenCL


QueryDevice: QueryDevice.c
	$(CC) $^ $(CCFLAGS) $(LIBS) -o $@

clean:
	rm -rf QueryDevice
