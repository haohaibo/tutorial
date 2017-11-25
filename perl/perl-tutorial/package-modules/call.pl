#!/usr/bin/perl

#require Foo;
use Foo;
use Module;


print "@INC\n";
Foo::bar('haohaibo');
Foo::blat('ncic');

Module::bar('ict');
Module::blat('ncic');

print "$Foo::i\n";
