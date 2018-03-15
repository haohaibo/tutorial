ifndef CC
	CC = gcc
endif

CCFLAGS=-std=c99
LIBS = -lOpenCL

QueryDevice: QueryDevice.c
	$(CC) $^ $(CCFLAGS) $(LIBS) -o $@

clean:
	rm -rf QueryDevice
