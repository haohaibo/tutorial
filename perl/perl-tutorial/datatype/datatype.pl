#!/usr/bin/perl

$myfirst = 123;
$mysecond = "123";

print "myfirst = $myfirst\n";
print "mysecond = $mysecond\n";

@arr = (1, 2, 3);
print "arr = @arr\n";

%h = ('a' => 1, 'b' => 2);

print %h;
print "\n";

# --integer--
$x = 12345;
if(111 + 12 == 123){
    print "add ok\n";
}

# 8 
$var1 = 045;
# 16
$var2 = 0x2f;
print "var1 = $var1\n";
print "var2 = $var2\n";

# --float--

$value = 9.01e+21 + 0.001 - 9.01e+21;
print ("第一个值为:", $value, "\n");

$value = 9.01e+21 - 9.01e+21 + 0.001;
print ("第二个值为:", $value, "\n");

$var = '这是
一个
多行
字符
串';
print "$var\n";

$str = "\uhaohaibo";
print "$str\n";

$str = "\Uhaohaibo";
print "$str\n";

