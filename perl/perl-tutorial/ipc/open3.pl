#!/usr/bin/perl

use strict;
use warnings;
use IPC::Open3;


local($CMD_IN, $CMD_OUT, $CMD_ERR);

my $pid = open3($CMD_IN, $CMD_OUT, $CMD_ERR, $ARGV[0]);

close($CMD_IN);

my @stdout_output = <CMD_OUT>;
my @stderr_output = <CMD_ERR>;

close(CMD_OUT);
close(CMD_ERR);

waitpid($pid, 0);

print "OUT:\n,@stdout_output";
print "ERR:\n,@stderr_output";
