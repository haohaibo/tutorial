#!/usr/bin/perl

package Module;

require Exporter;

@ISA = qw(Exporter);
print "@ISA\n";

# 默认导出的符号
@EXPORT = qw(bar blat);

sub bar { print "hello $_[0]\n";}
sub blat { print "world $_[0]\n";}

# not exported
sub splat { print "Not $_[0]\n"; }

1;

