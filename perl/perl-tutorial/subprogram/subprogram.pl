#!/usr/bin/perl

sub Hello{
    print "hello perl!\n";
}

# call
Hello();

sub Average{
    $n = scalar(@_);
    $sum = 0;

    foreach $item (@_){
        $sum += $item;
    }
    $average = $sum / $n;
    print "传入的参数为: @_\n";
    print "第一个参数为: $_[0]\n";
    print "平均值为: $average\n";
}

Average(10,20,40);

sub PrintList{
    my @list = @_;
    print "@list\n";
}

$para1 = 10;
@para2 = (1, 2, 3, 5);
# 列表放在最后一个参数上
PrintList($para1, @para2);


sub PrintHash{
    my (%hash) = @_;

    foreach my $key (keys %hash){
        my $value = $hash{$key};
        print "$key : $value\n";
    }
}

%hash = ('name'=>'Haibo Hao', 'age'=>25, 'major'=>'CS');
PrintHash(%hash);
#print "\n";

sub add2{
    $_[0] + $_[1];
}

print add2(1, 2);
print "\n";
