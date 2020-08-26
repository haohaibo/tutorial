#!/bin/bash

CL_COMPILER=clang-ocl  #/opt/rocm/bin/clang-ocl
CL_INFILE=$1
HSACO_OUTFILE=$2

if [ ! -f "$CL_INFILE" ];
then
    echo "Please Make sure $CL_INFILE is exists!!!"
    exit 0
fi
if [ $HSACO_OUTFILE == "" ];
then
    echo "Please add second parameter to specify the out file"
    exit 0
fi

OPTION=" -save-temps -mcpu=gfx803 -cl-denorms-are-zero"
$CL_COMPILER $OPTION $CL_INFILE -o $HSACO_OUTFILE
 
