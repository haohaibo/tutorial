HIP_PATH?= $(wildcard /opt/rocm/hip)
FILE1 = $(pwd)file1.txt
FILE2 = $(pwd)file2.txt

RELEASE = abc

# 这里$(warning RELEASE defined) 前面是两个空格
ifdef RELEASE
  $(warning RELEASE defined)
else
  $(warning RELEASE not defined)
endif

ifeq (,$(HIP_PATH))
	HIP_PATH=../../..
endif

HIP_PLATFORM=$(shell $(HIP_PATH)/bin/hipconfig --platform) 
HIPCC=$(HIP_PATH)/bin/hipcc

#HIP_PLATFORM=nvcc

ifeq ($(HIP_PLATFORM), nvcc)
	HIPCC_FLAGS = -gencode=compute_20,code=sm20
endif

ifeq ($(RELEASE),abc)
  $(warning RELEASE equal abc)
else
  $(warning RELEASE not equal abc)
endif

all:
	@echo "make all..."
	@echo "print to file1" > $(FILE1)
	@echo "print to file2" > $(FILE2)
	@echo $(HIP_PATH)
	@echo $(RELEASE)
	@echo $(HIP_PLATFORM)
	@echo $(HIPCC)
	@echo $(HIPCC_FLAGS)

