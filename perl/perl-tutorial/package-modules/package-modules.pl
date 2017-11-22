#!/usr/bin/perl


# main package
$i = 1;
print "package name : ", __PACKAGE__, " $i\n";

package Foo;
$i = 10;
print "package name : ", __PACKAGE__, " $i\n";


package main;
$i = 1000;
print "package name : ", __PACKAGE__, " $i\n";
print "package name : ", __PACKAGE__, " $Foo::i\n";
