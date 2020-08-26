#!/usr/bin/perl


use strict;
use IPC::Open3;
use kernels::hgemm_col_nt_64x64_8x8_gcn;

my $cmd = 'clrxasm -o kernel.co';
#my $cmd = 'cat > kernel.s';
my $pid = open3(*AS_SRC{IO}, *AS_OUT{IO}, *AS_ERR{IO}, $cmd);

print AS_SRC <<EOS;
.amd
.gpu Fiji
.64bit
.driver_info "@(#) OpenCL 2.0 AMD-APP (1912.5).  Driver version: 1912.5 (VM)"
EOS

kernels::hgemm_col_nt_64x64_8x8::generate(*AS_SRC{IO});

close(AS_SRC);

my @outlines = <AS_OUT>;
my @errlines = <AS_ERR>;
print "STDOUT:\n", @outlines, "\n";
print "STDERR:\n", @errlines, "\n";

waitpid( $pid, 0 );
