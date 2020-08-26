#!/bin/bash

perl kernel_rocm.pl
./isa2hsaco.sh kernel.s kernel.hsaco
./gemm.py kernel.hsaco -m 1024 -n 1024 -k 1024 -t rocm -c gfx803 -r 1 -v
