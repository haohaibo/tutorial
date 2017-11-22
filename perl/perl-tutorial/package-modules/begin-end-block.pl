#!/usr/bin/perl

package Foo;

print "BEGIN END block 实例\n";

BEGIN {
    print "this is BEGIN block\n";
}

END {
    print "this is END block\n";
}
