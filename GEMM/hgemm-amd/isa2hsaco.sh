#!/bin/bash

ASSEMBLER="/opt/rocm/opencl/bin/x86_64/clang "
ISA_INFILE=$1
HSACO_OUTFILE=$2
OPTION=" -target amdgcn--amdhsa -mcpu=fiji -Wa,-defsym,ROCM_METADATA_VERSION=4 "

if [ ! -f "$ISA_INFILE" ];
then
    echo "Please Make sure $ISA_INFILE is exists!!!"
    exit 0
fi
if [ $HSACO_OUTFILE == "" ];
then
    echo "Please add second parameter to specify the out file"
    exit 0
fi

$ASSEMBLER -x assembler $OPTION -c $ISA_INFILE -o ${ISA_INFILE}.o
$ASSEMBLER $OPTION ${ISA_INFILE}.o -o $HSACO_OUTFILE
rm ${ISA_INFILE}.o
