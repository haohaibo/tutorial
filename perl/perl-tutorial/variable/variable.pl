#!/usr/bin/perl
use strict;

my $age = 25;
my $name = "haohaibo";
my $salary = 2.0;

print "Age = $age\n";
print "Name = $name\n";
print "Salary =  $salary\n";

my @ages = (25, 30, 40);
my @names = ("google", "facebook", "amazon");

my @copy = @names;
my $size = @names;
print "@copy\n";
print "$size\n";


print "\$ages[0] = $ages[0]\n";
print "\$ages[1] = $ages[1]\n";
print "\$ages[2] = $ages[2]\n";
print "\$names[0] = $names[0]\n";
print "\$names[1] = $names[1]\n";
print "\$names[2] = $names[2]\n";

# hash
my %data = ("google", 1, "facebook", 2,  "amazon", 3);

print "\$data{'google'} = $data{'google'}\n";
print "\$data{'facebool'} = $data{'facebook'}\n";
print "\$data{'amazon'} = $data{'amazon'}\n";

# scalar calcate
# string calcate
my $str = "hello " . "world";
print "$str\n";

my $num = 4 + 5;
my $mul = 4 * 4;
my $mix = $str . $num;

print "$num\n";
print "$mul\n";
print "$mix\n";
 
print <<EOF;
some comments
another comments
EOF

print "file name = " . __FILE__ . "\n";
print "line number = " . __LINE__ . "\n";
print "package = " . __PACKAGE__ . "\n";

# 转化成对应的ASCII码的符号
my $smile  = v9786;
my $foo    = v102.111.111;
my $martin = v77.97.114.116.105.110; 
 
print "smile = $smile\n";
print "foo = $foo\n";
print "martin = $martin\n";
