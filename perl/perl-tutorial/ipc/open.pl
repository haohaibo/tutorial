#!/usr/bin/perl
use strict;
use warnings;

use IO::Select;
use IPC::Open3;
use Symbol 'gensym';

my ($cmd_in, $cmd_out, $cmd_err);
$cmd_err = gensym;
my $pid = open3($cmd_in, $cmd_out, $cmd_err, $ARGV[0]);

close($cmd_in);

my $select = IO::Select->new($cmd_out, $cmd_err);
my $stdout_output = '';
my $stderr_output = '';

while (my @ready = $select->can_read(5)) {
    foreach my $handle (@ready) {
        if (sysread($handle, my $buf, 4096)) {
            if ($handle == $cmd_out) {
                $stdout_output .= $buf;
            }
            else {
                $stderr_output .= $buf;
            }
        }
        else {
            # EOF or error
            $select->remove($handle);
        }
    }
}

if ($select->count) {
    print "Timed out\n";
    kill('TERM', $pid);
}

close($cmd_out);
close($cmd_err);

waitpid($pid, 0); # reap the exit code

print "OUT:\n", $stdout_output;
print "ERR:\n", $stderr_output;
