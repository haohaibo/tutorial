use strict;

my $a = "foo";
my $some_condition = 1;
if($some_condition) {
    my $b = "bar";
    print "$a\n";
    print "$b\n";
}

print "$a\n";

# print nothing, $b has fallen out of scope
print "$b\n";
