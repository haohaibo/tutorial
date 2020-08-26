#!/usr/bin/perl


use strict;
use IPC::Open3;
use kernels::hgemm_col_nt_64x64_8x8_rocm;

#my $cmd = 'clrxasm -o output.clo';
my $cmd = 'cat > kernel.s';
my $pid = open3(*AS_SRC{IO}, *AS_OUT{IO}, *AS_ERR{IO}, $cmd);

kernels::hgemm_col_nt_64x64_8x8_rocm::generate(*AS_SRC{IO});

close(AS_SRC);

my @outlines = <AS_OUT>;
my @errlines = <AS_ERR>;
print "STDOUT:\n", @outlines, "\n";
print "STDERR:\n", @errlines, "\n";

waitpid( $pid, 0 );
