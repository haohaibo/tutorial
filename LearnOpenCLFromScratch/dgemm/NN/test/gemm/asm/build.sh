clang -x assembler -target amdgcn--amdhsa -mcpu=fiji gemm.s  -c -o gemm.o
clang -target amdgcn--amdhsa gemm.o -o gemm.co
