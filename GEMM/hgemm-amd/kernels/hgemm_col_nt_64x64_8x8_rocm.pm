package kernels::hgemm_col_nt_64x64_8x8_rocm;

use strict;
use POSIX;

my %s =
(
    kernelArg => "0:1",
    gidx      => 2,  #12,
    gidy      => 3,  #13,
    gnumx     => 4,
    gnumy     => 5,
    lda       => 6,  #20,
    ldb       => 7,  #21,
    ldc       => 8,  #22,
    m         => 9,  #23,
    n         => 10, #24,
    k         => 11, #25,
    a         => 12, #26,
    b         => 13, #27,
    ldai4     => 6,  #20,
    ldbi4     => 7,  #21,
    ldai      => 14, #40,
    ldbi      => 15, #41,
    ldai8     => 16, #42,
    ldbi8     => 17, #43,
    i         => 18, #46,
    end       => 19, #47,
    ldci4     => 8,  #22,
    ldci      => 20, #48,
    ldci8     => 21, #49,
    ldci29    => 22, #51,
    temp      => 23, #52,
    mi4       => 9,  #23,
    mi        => 24, #53,
    ni4       => 25, #54,
    ni        => 26, #55,
    magic     => 27, #56,
    shift     => 41, #57
    aBuf      => 28, #14,
    bBuf      => 32, #16,
    cBuf      => 36, #18,
    sizeA     => 30, #44,
    sizeB     => 34, #45,
    sizeC     => 38, #50,
    aDesc     => 28, #28,
    bDesc     => 32, #32,
    cDesc     => 36,
    sgpr_count=> 42
);

my %v =
(
    C         => 0,
    A0        => 64,
    B0        => 72,
    A1        => 80,
    B1        => 88,
    loadA     => 96,
    loadB     => 104,
    lidxo     => 0,
    lidyo     => 1,
    lidx      => 112,
    lidy      => 113,
    lid4      => 114,
    lid16     => 115,
    zd        => 116,
    zi        => 116,
    trackA    => 120,
    ofstA     => 121,
    trackB    => 122,
    ofstB     => 123,
    readAs    => 124,
    readBs    => 125,
    writeS    => 126,
    trackC    => 120,
    ofstC     => 121,
    lidy4     => 116,
    temp      => 117,
    temp1     => 118,
    temp2     => 119,
    vgpr_count=> 127
);

my %pat =
(
#    ldArg32   => sub {return join' ','s_buffer_load_dword',"s$_[0],s[8:11],@{[$_[1]*0x10]}"},
#    ldArg64   => sub {return join' ','s_buffer_load_dwordx2',"s[$_[0]:@{[$_[0]+1]}],",'s[8:11],',"@{[$_[1]*0x10]}"},
#    ldDesc    => sub {return join' ','s_load_dwordx4',"s[$_[0]:@{[$_[0]+3]}],",'s[2:3],',"@{[0x180+$_[1]*0x20]}"},
#    ld2Gnum   => sub {return join' ','s_buffer_load_dwordx2',"s[$_[0]:@{[$_[0]+1]}],",'s[4:7],','0x20'},
#    ld2Gofst  => sub {return join' ','s_buffer_load_dwordx2',"s[$_[0]:@{[$_[0]+1]}],",'s[4:7],','0x60'},
    waitCnt   => sub {return join' ','s_waitcnt',(($_[0]=~s/l(\d+)/lgkmcnt($1)/r)=~s/v(\d+)/vmcnt($1)/r)},
#    injBase   => sub {return join' ','s_add_u32',"s$_[0],","s$_[0],","s$_[1]\n",
#                        ' 'x6,'s_addc_u32',"s@{[$_[0]+1]},","s@{[$_[0]+1]},","s@{[$_[1]+1]}"},
    #injFmt    => sub {return join' ','s_or_b32',"s@{[$_[0]+1]},","s@{[$_[0]+1]},","0x80000\n",
    #                    ' 'x6,'s_and_b32',"s@{[$_[0]+1]},","s@{[$_[0]+1]},",'0x3fffffff'},
    injFmt    => sub {return join' ','s_or_b32',"s@{[$_[0]+1]},","s@{[$_[0]+1]},","0x80000\n",
                        ' 'x6,'s_mov_b32', "s@{[$_[0]+3]},", '0x00064000'},
#    injSize   => sub {return join' ','s_mov_b32',"s@{[$_[0]+2]},","s$_[1]"}
);

sub generate {
    my $AS_SRC = shift;
    print $AS_SRC <<EOS;
.if (.option.machine_version_major != 8) && (.option.machine_version_major != 9)
.error "ERROR: specified target machine not supported"
.endif
        .text
        .hsa_code_object_version 2,1
        .hsa_code_object_isa
        .globl  hgemm_col_nt_64x64_8x8  ; -- Begin function hgemm_col_nt_64x64_8x8
        .p2align        8
        .type   hgemm_col_nt_64x64_8x8,\@function
        .amdgpu_hsa_kernel hgemm_col_nt_64x64_8x8
hgemm_col_nt_64x64_8x8:                 ; \@hgemm_col_nt_64x64_8x8
        .amd_kernel_code_t
                amd_machine_version_major = .option.machine_version_major
                amd_machine_version_minor = .option.machine_version_minor
                amd_machine_version_stepping = .option.machine_version_stepping
                is_ptr64 = 1
                float_mode = 0
                user_sgpr_count = 2
                is_xnack_enabled = 0
                enable_sgpr_workgroup_id_x = 1
                enable_sgpr_workgroup_id_y = 1
                enable_vgpr_workitem_id = 1
                enable_sgpr_kernarg_segment_ptr = 1
                workitem_vgpr_count = $v{vgpr_count}
                wavefront_sgpr_count = $s{sgpr_count}
                workgroup_group_segment_byte_size = 4096
                kernarg_segment_byte_size = 104
                granulated_workitem_vgpr_count = @{[ceil(($v{vgpr_count} + 1) / 4.0) - 1]}
                granulated_wavefront_sgpr_count = @{[ceil(($s{sgpr_count} + 1) / 8.0) - 1]}
        .end_amd_kernel_code_t
        ;s_mov_b32 s$s{temp}, 0
        s_mov_b32 m0, 4096
        ; s$s{magic} ~ parameter magic
        s_load_dword s$s{magic}, s[$s{kernelArg}], 0x34
        ; s$s{shift} ~ parameter shift
        s_load_dword s$s{shift}, s[$s{kernelArg}], 0x38
        ; s$s{gnumx} ~ parameter gnumx
        s_load_dword s$s{gnumx}, s[$s{kernelArg}], 0x3c
        ; s$s{gnumy} ~ parameter gnumy
        s_load_dword s$s{gnumy}, s[$s{kernelArg}], 0x40
        v_mov_b32 v$v{lidx}, v$v{lidxo}
        v_mov_b32 v$v{lidy}, v$v{lidyo}
        v_lshrrev_b32 v$v{lid4}, 1, v$v{lidy}
        v_lshlrev_b32 v$v{lid16}, 3, v$v{lidy}
        v_and_b32 v$v{lid16}, 15, v$v{lid16}
        v_or_b32 v$v{lid16}, v$v{lidx}, v$v{lid16}
        @{[$pat{waitCnt}('l2')]}
        ; s$s{lda} ~ parameter lda
        s_load_dword s$s{lda}, s[$s{kernelArg}], 0x18
        ; s$s{ldb} ~ parameter ldb
        s_load_dword s$s{ldb}, s[$s{kernelArg}], 0x1c
        ; s$s{k} ~ parameter k
        s_load_dword s$s{k}, s[$s{kernelArg}], 0x2c
        v_mov_b32 v$v{temp}, s$s{gidy}
        v_add_u32 v$v{temp}, vcc, s$s{gidx}, v$v{temp}
        v_mul_hi_u32 v$v{temp1}, s$s{magic}, v$v{temp}
        @{[$pat{waitCnt}('l0')]}
        ; s[$s{aBuf}:@{[$s{aBuf}+1]}] ~ parameter A
        s_load_dwordx2 s[$s{aBuf}:@{[$s{aBuf}+1]}], s[$s{kernelArg}], 0
        ;\@{[$pat{ldDesc}($s{aDesc},0)]}
        v_lshrrev_b32 v$v{temp1}, s$s{shift}, v$v{temp1}
        v_mul_u32_u24 v$v{temp1}, v$v{temp1}, s$s{gnumy}
        v_sub_u32 v$v{temp}, vcc, v$v{temp}, v$v{temp1}
        @{[$pat{waitCnt}('l0')]}
        ; s[$s{bBuf}:@{[$s{bBuf}+1]}] ~ parameter B
        s_load_dwordx2 s[$s{bBuf}:@{[$s{bBuf}+1]}], s[$s{kernelArg}], 0x8
        ;\@{[$pat{ldDesc}($s{bDesc},1)]}
        v_readfirstlane_b32 s$s{temp}, v$v{temp}
        s_cmp_lg_u32 s$s{magic}, 0
        s_cmov_b32 s$s{gidy}, s$s{temp}
        @{[$pat{waitCnt}('l0')]}
        ; s$s{m} ~ parameter m
        s_load_dword s$s{m}, s[$s{kernelArg}], 0x24
        ; s$s{n} ~ parameter n
        s_load_dword s$s{n}, s[$s{kernelArg}], 0x28
        s_lshr_b32 s$s{ldai}, s$s{ldai4}, 2
        s_lshl_b32 s$s{ldai8}, s$s{ldai4}, 1
        s_lshr_b32 s$s{ldbi}, s$s{ldbi4}, 2
        s_lshl_b32 s$s{ldbi8}, s$s{ldbi4}, 1
        s_mul_i32 s$s{sizeA}, s$s{k}, s$s{ldai8}
        s_mul_i32 s$s{sizeB}, s$s{k}, s$s{ldbi8}
        @{[$pat{waitCnt}('l0')]}
        ; s$s{ldc} ~ parameter ldc
        s_load_dword s$s{ldc}, s[$s{kernelArg}], 0x20
        ; s[$s{cBuf}:@{[$s{cBuf}+1]}] ~ parameter C
        s_load_dwordx2 s[$s{cBuf}:@{[$s{cBuf}+1]}], s[$s{kernelArg}], 0x10
        ;\@{[$pat{ldDesc}($s{cDesc},2)]}
        ;\@{[$pat{injBase}($s{aDesc},$s{aBuf})]}
        @{[$pat{injFmt}($s{aDesc})]}
        ;\@{[$pat{injSize}($s{aDesc},$s{sizeA})]}
        @{[$pat{waitCnt}('l0')]}
        ; s$s{a} ~ parameter a(alpha)
        s_load_dword s$s{a}, s[$s{kernelArg}], 0x30
        ; s$s{b} ~ parameter b(beta)
        ;s_load_dword s$s{b}, s[$s{kernelArg}], 0x32
        ;\@{[$pat{injBase}($s{bDesc},$s{bBuf})]}
        @{[$pat{injFmt}($s{bDesc})]}
        ;\@{[$pat{injSize}($s{bDesc},$s{sizeB})]}
        @{[$pat{waitCnt}('l0')]}
        s_lshr_b32 s$s{mi}, s$s{mi4}, 2
        s_lshr_b32 s$s{ni}, s$s{ni4}, 2
        v_mov_b32 v$v{temp1}, 0xfffffff
        v_mad_u32_u24 v$v{trackA}, s$s{gidx}, 0x10, v$v{lid16}
        v_cmp_lt_u32 vcc, v$v{trackA}, s$s{mi}
        v_cndmask_b32 v$v{trackA}, v$v{temp1}, v$v{trackA}, vcc
        v_mad_u32_u24 v$v{trackA}, s$s{ldai}, v$v{lid4}, v$v{trackA}
        v_mad_u32_u24 v$v{trackB}, s$s{gidy}, 0x10, v$v{lid16}
        v_cmp_lt_u32 vcc, v$v{trackB}, s$s{ni}
        v_cndmask_b32 v$v{trackB}, v$v{temp1}, v$v{trackB}, vcc
        v_mad_u32_u24 v$v{trackB}, s$s{ldbi}, v$v{lid4}, v$v{trackB}
        v_lshlrev_b32 v$v{ofstA}, 3, s$s{lda}
        v_lshlrev_b32 v$v{ofstB}, 3, s$s{ldb}
        v_mul_u32_u24 v$v{writeS}, 0x100, v$v{lid4}
        v_mad_u32_u24 v$v{writeS}, v$v{lid16}, 16, v$v{writeS}
        ;tbuffer_load_format_xyzw v[$v{loadA}:@{[$v{loadA}+3]}], v$v{trackA}, s[$s{aDesc}:@{[$s{aDesc}+3]}], 0 idxen format:[16_16_16_16,uint]
        ;tbuffer_load_format_xyzw v[$v{loadB}:@{[$v{loadB}+3]}], v$v{trackB}, s[$s{bDesc}:@{[$s{bDesc}+3]}], 0 idxen format:[16_16_16_16,uint]
        ;tbuffer_load_format_xyzw v[@{[$v{loadA}+4]}:@{[$v{loadA}+7]}], v[$v{trackA}:@{[$v{trackA}+1]}], s[$s{aDesc}:@{[$s{aDesc}+3]}], 0 idxen offen format:[16_16_16_16,uint]
        ;tbuffer_load_format_xyzw v[@{[$v{loadB}+4]}:@{[$v{loadB}+7]}], v[$v{trackB}:@{[$v{trackB}+1]}], s[$s{bDesc}:@{[$s{bDesc}+3]}], 0 idxen offen format:[16_16_16_16,uint]
	tbuffer_load_format_xyzw v[$v{loadA}:@{[$v{loadA}+3]}], v$v{trackA}, s[$s{aDesc}:@{[$s{aDesc}+3]}], dfmt:12, nfmt:4, 0 idxen
        tbuffer_load_format_xyzw v[$v{loadB}:@{[$v{loadB}+3]}], v$v{trackB}, s[$s{bDesc}:@{[$s{bDesc}+3]}], dfmt:12, nfmt:4, 0, idxen
        tbuffer_load_format_xyzw v[@{[$v{loadA}+4]}:@{[$v{loadA}+7]}], v[$v{trackA}:@{[$v{trackA}+1]}], s[$s{aDesc}:@{[$s{aDesc}+3]}], dfmt:12, nfmt:4, 0 idxen offen
        tbuffer_load_format_xyzw v[@{[$v{loadB}+4]}:@{[$v{loadB}+7]}], v[$v{trackB}:@{[$v{trackB}+1]}], s[$s{bDesc}:@{[$s{bDesc}+3]}], dfmt:12, nfmt:4, 0 idxen offen
        v_add_u32 v$v{trackA}, vcc, s$s{ldai8}, v$v{trackA}
        v_add_u32 v$v{trackB}, vcc, s$s{ldbi8}, v$v{trackB}
        v_lshlrev_b32 v$v{readAs}, 4, v$v{lidx}
        v_lshlrev_b32 v$v{readBs}, 4, v$v{lidy}
        v_add_u32 v$v{readBs}, vcc, 2048, v$v{readBs}
        v_mov_b32 v$v{zd}, 0
        v_mov_b32 v@{[$v{zd}+1]}, 0
        v_mov_b32 v@{[$v{zd}+2]}, 0
        v_mov_b32 v@{[$v{zd}+3]}, 0
        ds_write_b128 v$v{zi}, v[$v{zd}:@{[$v{zd}+3]}]
        s_mov_b32 s$s{i}, 0
        s_add_i32 s$s{end}, -1, s$s{k}
        s_lshr_b32 s$s{end}, s$s{end}, 3
        @{[$pat{waitCnt}('l0')]}
        s_lshr_b32 s$s{ldci}, s$s{ldci4}, 2
        s_lshl_b32 s$s{ldci8}, s$s{ldci4}, 1
        s_mul_i32 s$s{sizeC}, s$s{n}, s$s{ldci8}
        ;\@{[$pat{injBase}($s{cDesc},$s{cBuf})]}
        @{[$pat{injFmt}($s{cDesc})]}
        ;\@{[$pat{injSize}($s{cDesc},$s{sizeC})]}
EOS
    map {print $AS_SRC join(' ',' 'x7,'ds_read_b128',"v[@{[$v{C}+$_*4]}:@{[$v{C}+$_*4+3]}],","v$v{zi}\n")} 0..15;
    print $AS_SRC <<EOS;
        @{[$pat{waitCnt}('l0&v3')]}
        ds_write_b128 v$v{writeS}, v[$v{loadA}:@{[$v{loadA}+3]}]
        @{[$pat{waitCnt}('v2')]}
        ds_write_b128 v$v{writeS}, v[$v{loadB}:@{[$v{loadB}+3]}] offset:2048
        @{[$pat{waitCnt}('l0')]}
        ds_read_b128 v[$v{A0}:@{[$v{A0}+3]}], v$v{readAs}
        ds_read_b128 v[$v{B0}:@{[$v{B0}+3]}], v$v{readBs}
        ds_read_b128 v[@{[$v{A0}+4]}:@{[$v{A0}+7]}], v$v{readAs} offset:128
        ds_read_b128 v[@{[$v{B0}+4]}:@{[$v{B0}+7]}], v$v{readBs} offset:128
        @{[$pat{waitCnt}('l0')]}
LOOP_hgemm_col_nt_64x64_8x8:
EOS
    foreach my $i (0..7)
    {
        print $AS_SRC join(' ','        ds_read_b128',"v[@{[$v{A1}+$i%2*($v{A0}-$v{A1})]}:@{[$v{A1}+$i%2*($v{A0}-$v{A1})+3]}],","v$v{readAs}","offset:@{[($i+1)%8*256]}\n");
        print $AS_SRC join(' ','        ds_read_b128',"v[@{[$v{B1}+$i%2*($v{B0}-$v{B1})]}:@{[$v{B1}+$i%2*($v{B0}-$v{B1})+3]}],","v$v{readBs}","offset:@{[($i+1)%8*256]}\n");
        print $AS_SRC join(' ','        ds_read_b128',"v[@{[$v{A1}+$i%2*($v{A0}-$v{A1})+4]}:@{[$v{A1}+$i%2*($v{A0}-$v{A1})+7]}],","v$v{readAs}","offset:@{[($i+1)%8*256+128]}\n");
        print $AS_SRC join(' ','        ds_read_b128',"v[@{[$v{B1}+$i%2*($v{B0}-$v{B1})+4]}:@{[$v{B1}+$i%2*($v{B0}-$v{B1})+7]}],","v$v{readBs}","offset:@{[($i+1)%8*256+128]}\n");
        foreach my $j (0..7)
        {
            if ($i==0&&$j==3) {
		print $AS_SRC <<EOS;
	;tbuffer_load_format_xyzw v[$v{loadA}:@{[$v{loadA}+3]}], v$v{trackA}, s[$s{aDesc}:@{[$s{aDesc}+3]}], 0 idxen format:[16_16_16_16,uint]
	tbuffer_load_format_xyzw v[$v{loadA}:@{[$v{loadA}+3]}], v$v{trackA}, s[$s{aDesc}:@{[$s{aDesc}+3]}], dfmt:12, nfmt:4, 0 idxen
EOS
            } elsif ($i==0&&$j==4) {
		print $AS_SRC <<EOS;
        ;tbuffer_load_format_xyzw v[$v{loadB}:@{[$v{loadB}+3]}], v$v{trackB}, s[$s{bDesc}:@{[$s{bDesc}+3]}], 0 idxen format:[16_16_16_16,uint]
	tbuffer_load_format_xyzw v[$v{loadB}:@{[$v{loadB}+3]}], v$v{trackB}, s[$s{bDesc}:@{[$s{bDesc}+3]}], dfmt:12, nfmt:4, 0, idxen
EOS
            } elsif ($i==4&&$j==3) {
		print $AS_SRC <<EOS;
        ;tbuffer_load_format_xyzw v[@{[$v{loadA}+4]}:@{[$v{loadA}+7]}], v[$v{trackA}:@{[$v{trackA}+1]}], s[$s{aDesc}:@{[$s{aDesc}+3]}], 0 idxen offen format:[16_16_16_16,uint]
	tbuffer_load_format_xyzw v[@{[$v{loadA}+4]}:@{[$v{loadA}+7]}], v[$v{trackA}:@{[$v{trackA}+1]}], s[$s{aDesc}:@{[$s{aDesc}+3]}], dfmt:12, nfmt:4, 0 idxen offen
EOS
            } elsif ($i==4&&$j==4) {
		print $AS_SRC <<EOS;
        ;tbuffer_load_format_xyzw v[@{[$v{loadB}+4]}:@{[$v{loadB}+7]}], v[$v{trackB}:@{[$v{trackB}+1]}], s[$s{bDesc}:@{[$s{bDesc}+3]}], 0 idxen offen format:[16_16_16_16,uint]
	tbuffer_load_format_xyzw v[@{[$v{loadB}+4]}:@{[$v{loadB}+7]}], v[$v{trackB}:@{[$v{trackB}+1]}], s[$s{bDesc}:@{[$s{bDesc}+3]}], dfmt:12, nfmt:4, 0 idxen offen
EOS
                print $AS_SRC join(' ',' 'x7,'v_add_u32',"v$v{trackA},",'vcc,',"s$s{ldai8},","v$v{trackA}\n");
                print $AS_SRC join(' ',' 'x7,'v_add_u32',"v$v{trackB},",'vcc,',"s$s{ldbi8},","v$v{trackB}\n");
            } elsif ($i==6&&$j==3) {
                print $AS_SRC join(' ',' 'x7,"@{[$pat{waitCnt}('v3')]}\n",' 'x6,'ds_write_b128',"v$v{writeS},","v[$v{loadA}:@{[$v{loadA}+3]}]\n");
                print $AS_SRC join(' ',' 'x7,'s_add_u32',"s$s{i},",'1,',"s$s{i}\n");
            } elsif ($i==6&&$j==4) {
                print $AS_SRC join(' ',' 'x7,"@{[$pat{waitCnt}('v2')]}\n",' 'x6,'ds_write_b128',"v$v{writeS},","v[$v{loadB}:@{[$v{loadB}+3]}]","offset:2048\n");
                print $AS_SRC join(' ',' 'x7,'s_cmp_gt_u32',"s$s{i},","s$s{end}\n");
            } elsif ($i==2&&$j==3) {
                print $AS_SRC join(' ',' 'x7,"@{[$pat{waitCnt}('v3')]}\n",' 'x6,'ds_write_b128',"v$v{writeS},","v[@{[$v{loadA}+4]}:@{[$v{loadA}+7]}]","offset:1024\n");
            } elsif ($i==2&&$j==4) {
                print $AS_SRC join(' ',' 'x7,"@{[$pat{waitCnt}('v2')]}\n",' 'x6,'ds_write_b128',"v$v{writeS},","v[@{[$v{loadB}+4]}:@{[$v{loadB}+7]}]","offset:3072\n")
            }
            foreach my $k (0..7)
            {
                print $AS_SRC join(' ',' 'x7,'v_mac_f16',"v@{[$v{C}+$j*8+$k]},","v@{[$v{A0}+$i%2*($v{A1}-$v{A0})+$k]},","v@{[$v{B0}+$i%2*($v{B1}-$v{B0})+$j]}\n");
            }
        }
    }
    print $AS_SRC <<EOS;
        s_cbranch_scc0 LOOP_hgemm_col_nt_64x64_8x8
        v_mov_b32 v$v{temp1}, 0xfffffff
        v_mov_b32 v$v{temp2}, 64
        v_lshlrev_b32 v$v{lidy4}, 2, v$v{lidy}
        v_mad_u32_u24 v$v{trackC}, s$s{gidx}, 16, v$v{lidx}
        v_add_u32 v$v{temp}, vcc, 8, v$v{trackC}
        v_cmp_lt_u32 vcc, v$v{trackC}, s$s{mi}
        v_cndmask_b32 v$v{trackC}, v$v{temp1}, v$v{trackC}, vcc
        v_cmp_lt_u32 vcc, v$v{temp}, s$s{mi}
        v_cndmask_b32 v$v{ofstC}, v$v{temp1}, v$v{temp2}, vcc
        v_mad_u32_u24 v$v{temp}, s$s{gidy}, 64, v$v{lidy4}
        v_mad_u32_u24 v$v{trackC}, v$v{temp}, s$s{ldci}, v$v{trackC}
        s_mul_i32 s$s{ldci29}, 29, s$s{ldci}
EOS
    foreach my $j (0..7)
    {
        foreach my $k (0..3)
        {
            print $AS_SRC join(' ',' 'x7,'v_mul_f16',"v@{[$v{C}+$j*8+$k]},","v@{[$v{C}+$j*8+$k]},","s$s{a}\n");
        }
	print $AS_SRC <<EOS;
        ;tbuffer_store_format_xyzw v[@{[$v{C}+$j*8]}:@{[$v{C}+$j*8+3]}], v$v{trackC}, s[$s{cDesc}:@{[$s{cDesc}+3]}], 0 idxen glc format:[16_16_16_16,uint]
	tbuffer_store_format_xyzw v[@{[$v{C}+$j*8]}:@{[$v{C}+$j*8+3]}], v$v{trackC}, s[$s{cDesc}:@{[$s{cDesc}+3]}], dfmt:12, nfmt:4, 0 idxen glc
EOS
        foreach my $k (4..7)
        {
            print $AS_SRC join(' ',' 'x7,'v_mul_f16',"v@{[$v{C}+$j*8+$k]},","v@{[$v{C}+$j*8+$k]},","s$s{a}\n");
        }
	print $AS_SRC <<EOS;
        ;tbuffer_store_format_xyzw v[@{[$v{C}+$j*8+4]}:@{[$v{C}+$j*8+7]}], v[$v{trackC}:@{[$v{trackC}+1]}], s[$s{cDesc}:@{[$s{cDesc}+3]}], 0 idxen offen glc format:[16_16_16_16,uint]
	tbuffer_store_format_xyzw v[@{[$v{C}+$j*8+4]}:@{[$v{C}+$j*8+7]}], v[$v{trackC}:@{[$v{trackC}+1]}], s[$s{cDesc}:@{[$s{cDesc}+3]}], dfmt:12, nfmt:4 0 idxen offen glc
EOS
        print $AS_SRC join(' ',' 'x7,'v_add_u32',"v$v{trackC},",'vcc,',"s@{[$j==3?$s{ldci29}:$s{ldci}]},","v$v{trackC}\n");
    }
    print $AS_SRC ' 'x8 . "s_endpgm\n";
    print $AS_SRC <<EOS;
.Lfunc_end0:
	.size	hgemm_col_nt_64x64_8x8, .Lfunc_end0-hgemm_col_nt_64x64_8x8
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 888
; NumSgprs: $s{sgpr_count}
; NumVgprs: $v{vgpr_count}
; ScratchSize: 0
; codeLenInByte = 888
; NumSgprs: $s{sgpr_count}
; NumVgprs: $v{vgpr_count}
; FloatMode: 192
; IeeeMode: 1
; ScratchSize: 0
; LDSByteSize: 4096 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: $s{sgpr_count}
; NumVGPRsForWavesPerEU: $v{vgpr_count}
; ReservedVGPRFirst: 0
; ReservedVGPRCount: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 1
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 1

	.ident	"clang version 4.0 "
	.section	".note.GNU-stack"

.ifndef ROCM_METADATA_VERSION
.error "ROCM_METADATA_VERSION must be defined(3/4)"
.endif
.if ROCM_METADATA_VERSION == 3
	.amdgpu_code_object_metadata
---
Version:         [ 1, 0 ]
Kernels:         
  - Name:            hgemm_col_nt_64x64_8x8
    Language:        OpenCL C
    LanguageVersion: [ 1, 2 ]
    Attrs:           
      ReqdWorkGroupSize: [ 8, 8, 1 ]
    Args:            
      - Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       I16
        AccQual:         Default
        AddrSpaceQual:   Global
        IsConst:         true
        Name:            A
        TypeName:        'short*'
      - Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       I16
        AccQual:         Default
        AddrSpaceQual:   Global
        IsConst:         true
        Name:            B
        TypeName:        'short*'
      - Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       I16
        AccQual:         Default
        AddrSpaceQual:   Global
        Name:            C
        TypeName:        'short*'
      - Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
        Name:            lda
        TypeName:        uint
      - Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
        Name:            ldb
        TypeName:        uint
      - Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
        Name:            ldc
        TypeName:        uint
      - Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
        Name:            m
        TypeName:        uint
      - Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
        Name:            n
        TypeName:        uint
      - Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
        Name:            k
        TypeName:        uint
      - Size:            2
        Align:           2
        ValueKind:       ByValue
        ValueType:       I16
        AccQual:         Default
        Name:            a
        TypeName:        short
      - Size:            2
        Align:           2
        ValueKind:       ByValue
        ValueType:       I16
        AccQual:         Default
        Name:            b
        TypeName:        short
      - Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       I32
        AccQual:         Default
        Name:            magic
        TypeName:        int
      - Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       I32
        AccQual:         Default
        Name:            shift
        TypeName:        int
      - Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
        Name:            gnumx
        TypeName:        uint
      - Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
        Name:            gnumy
        TypeName:        uint
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetX
        ValueType:       I64
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetY
        ValueType:       I64
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetZ
        ValueType:       I64
    CodeProps:       
      KernargSegmentSize: 104
      WorkgroupGroupSegmentSize: 4096
      WavefrontNumSGPRs: $s{sgpr_count}
      WorkitemNumVGPRs: $v{vgpr_count}
      KernargSegmentAlign: 4
      GroupSegmentAlign: 4
      PrivateSegmentAlign: 4
      WavefrontSize:   6
...
	.end_amdgpu_code_object_metadata
.endif

.if ROCM_METADATA_VERSION == 4
	.amd_amdgpu_hsa_metadata
---
Version:         [ 1, 0 ]
Kernels:         
  - Name:            hgemm_col_nt_64x64_8x8
    SymbolName:      'hgemm_col_nt_64x64_8x8\@kd'
    Language:        OpenCL C
    LanguageVersion: [ 1, 2 ]
    Attrs:           
      ReqdWorkGroupSize: [ 8, 8, 1 ]
    Args:            
      - Name:            A
        TypeName:        'short*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       I16
        AddrSpaceQual:   Global
        AccQual:         Default
        IsConst:         true
      - Name:            B
        TypeName:        'short*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       I16
        AddrSpaceQual:   Global
        AccQual:         Default
        IsConst:         true
      - Name:            C
        TypeName:        'short*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       I16
        AddrSpaceQual:   Global
        AccQual:         Default
      - Name:            lda
        TypeName:        uint
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
      - Name:            ldb
        TypeName:        uint
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
      - Name:            ldc
        TypeName:        uint
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
      - Name:            m
        TypeName:        uint
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
      - Name:            n
        TypeName:        uint
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
      - Name:            k
        TypeName:        uint
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
      - Name:            a
        TypeName:        short
        Size:            2
        Align:           2
        ValueKind:       ByValue
        ValueType:       I16
        AccQual:         Default
      - Name:            b
        TypeName:        short
        Size:            2
        Align:           2
        ValueKind:       ByValue
        ValueType:       I16
        AccQual:         Default
      - Name:            magic
        TypeName:        int
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       I32
        AccQual:         Default
      - Name:            shift
        TypeName:        int
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       I32
        AccQual:         Default
      - Name:            gnumx
        TypeName:        uint
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
      - Name:            gnumy
        TypeName:        uint
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
        AccQual:         Default
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetX
        ValueType:       I64
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetY
        ValueType:       I64
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetZ
        ValueType:       I64
    CodeProps:       
      KernargSegmentSize: 104
      GroupSegmentFixedSize: 4096
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign: 8
      WavefrontSize:   64
      NumSGPRs:        $s{sgpr_count}
      NumVGPRs:        $v{vgpr_count}
      MaxFlatWorkGroupSize: 64
...

	.end_amd_amdgpu_hsa_metadata
.endif

EOS
}
