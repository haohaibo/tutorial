#!/usr/bin/perl

%data = ('google', 'google.com', 'facebook', 'facebook.com', 'amazon', 'amazon.com');

print "\$data{'google'} = $data{'google'}\n";
print "\$data{'amazon'} = $data{'amazon'}\n";
print "\$data{'facebook'} = $data{'facebook'}\n";

# 提取哈希值
%data = (-taobao => 45, -google => 30, -runoob => 40);
 
@array = @data{-taobao, -runoob};
 
print "Array : @array\n";

%data = ('google'=>'google.com', 'facebook'=>'facebook.com', 'amazon'=>'amazon.com', 'taobao'=>'taobao.com');
# 读取所有key
# keys %HASH
@names = keys %data;
print "@names\n";

# 读取所有value
# values %HASH
@urls = values %data;
print "@urls\n";

if(exists($data{'facebook'})){
    print "facebook's website is $data{'facebook'}\n";
}else{
    print "key 'facebook' does not exists\n";
}


# 删除哈希中的元素
delete $data{'taobao'};
@keys = keys %data;
$size = @keys;
print "哈希大小: $size\n";
