#!/usr/bin/perl

package Foo;

sub bar{
    print "Hello $_[0]\n";
}

sub blat{
    print "world $_[0]\n";
}
our $i = 9;
1;
