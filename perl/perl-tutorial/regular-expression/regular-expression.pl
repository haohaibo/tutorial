#!/usr/bin/perl

$bar = "I am facebook site. welcome to facebook site.";

# 匹配操作符
if($bar =~ /face/){
    print "第一次匹配\n";
}else{
    print "第一次不匹配\n";
}

print "匹配前的字符串: $`\n";
print "匹配的字符串: $&\n";
print "剩余字符串: $'\n";

$bar = "facebook";
if($bar =~ /face/){
    print "第二次匹配\n";
}else{
    print "第二次不匹配\n";
}


$bar = "I am facebook site. welcome to facebook site.";
# 替换操作符
$bar =~ s/facebook/google/;
print "$bar\n";

$bar =~ tr/a-z/A-Z/;
print "$bar\n";
