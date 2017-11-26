#!/usr/bin/perl
#use strict;

my @hits = (25, 30, 40);             
my @names = ("google", "runoob", "taobao");
 
print "\$hits[0] = $hits[0]\n";
print "\$hits[1] = $hits[1]\n";
print "\$hits[2] = $hits[2]\n";
print "\$names[0] = $names[0]\n";
print "\$names[1] = $names[1]\n";
print "\$names[2] = $names[2]\n";

my @array = (1, 2, 'Hello');
print "\$array[0] = $array[0]\n";
print "\$array[1] = $array[1]\n";
print "\$array[2] = $array[2]\n";

my @array = qw/这是 一个 数组/;
print "\$array[0] = $array[0]\n";
print "\$array[1] = $array[1]\n";
print "\$array[2] = $array[2]\n";

my @sites = qw/google taobao runoob/;
 
print "$sites[0]\n";
print "$sites[1]\n";
print "$sites[2]\n";
print "$sites[-1]\n";    # 负数，反向读取

my @var_10 = (1..10);
my @var_20 = (10..20);
my @var_abc = (a..z);
 
print "@var_10\n";   # 输出 1 到 10
print "@var_20\n";   # 输出 10 到 20
print "@var_abc\n";  # 输出 a 到 z


my @array = (1,2,3);
   $array[50] = 4;
 
my $size = @array;
my $max_index = $#array;
 
print "数组大小: $size\n";
print "最大索引: $max_index\n";

# 切割数组 array
my @sites = qw/google taobao runoob weibo qq facebook 网易/;
 
my @sites2 = @sites[3,4,5];
 
print "@sites2\n";

 
my @sites3 = @sites[3..6];
 
print "@sites3\n";

# 替换元素
@nums = (1..30);
print "替换前： @nums\n";
splice(@nums, 5,6,21..26);
print "替换后： @nums\n";

# 将字符串转换为数组
# 定义字符串
$var_test = "runoob";
$var_string = "www-runoob-com";
$var_names = "google,taobao,runoob,weibo";
 
# 字符串转为数组
@test = split('', $var_test);
@string = split('-', $var_string);
@names  = split(',', $var_names);
 
print "$test[3]\n";  # 输出 o
print "$string[2]\n";  # 输出 com
print "$names[0]\n";   # 输出 weibo

# 数组转换为字符串
# 定义字符串
$var_string = "www-runoob-com";
$var_names = "google,taobao,runoob,weibo";
 
# 字符串转为数组
@string = split('-', $var_string);
@names  = split(',', $var_names);
 
  
# 数组转为字符串
$string1 = join( '.', @string );
$string2 = join( ' ', @names );
 
print "$string1\n";
print "$string2\n";

# 定义数组
@sites = qw(google taobao runoob facebook);
print "排序前: @sites\n";
 
# 对数组进行排序
@sites = sort(@sites);
print "排序前: @sites\n";

# 特殊变量 $[ 数组第一索引值,一般为0,可以设置
#定义数组
@sites = qw(google amazon taobao runoob facebook);
print "网站: @sites\n";
 
# 设置数组的第一个索引为 1
$[ = 1;
 
print "\@sites[1]: $sites[1]\n";
print "\@sites[2]: $sites[2]\n";

# 合并数组
@numbers = (1,3,(4,5,6));
print "numbers = @numbers\n";

@odd = (1,3,5);
@even = (2, 4, 6);
@numbers = (@odd, @even);

print "numbers = @numbers\n";

# 从列表中选择元素
$var = (5,4,3,2,1)[3];
print "var 的值为 = $var\n";

@list = (5,4,3,2,1)[1..3];
print "list 的值 = @list\n";

@arr = (4,7,21,111);
print "befor: @arr\n";
$ele = shift @arr;
print "\$ele = $ele\n";
print "after: @arr\n";
