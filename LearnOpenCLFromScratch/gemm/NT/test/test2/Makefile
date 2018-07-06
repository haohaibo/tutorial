CC = clang-ocl
CFLAGS=-save-temps -mcpu=gfx803 -cl-denorms-are-zero
CSRCS := $(shell find . -name '*.cl')
COBJS := $(subst .cl,.hsaco,$(CSRCS))
#test:
#	echo $(COBJS)
#	echo $(CSRCS)
#
$(COBJS): $(CSRCS) 
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -rf *.hsaco *.i *.bc *.o *.s


