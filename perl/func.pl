use strict;

sub message {
    print "Hello world\n";
}

sub add {
    my $result = $_[0] + $_[1];
    print "The result was: $result\n";
}

sub add2 {
    (my $na, my $nb) = @_;
    my $result = $na + $nb;
    print "The result was: $result\n";
}

# shift function is a stack, shift return(remove) the first element of a array
sub add3 {
    my $na = shift;
    my $nb = shift;
    my $result = $na + $nb;
    print "\$na = $na\n";
    print "\$nb = $nb\n";
    print "The result was: $result\n";
    return $result;
}

sub display_hash {
    my (%hash) = @_;
    foreach (%hash) {
        print "$_ => $hash{$_}\n";
    }
}

# both are OK
message();
message;

add(1,2);
add2(2,3);
print add3(2,231),"\n";

my @arr = ("Haibo Hao","ict","apple","red");
print @arr,"\n";
display_hash(@arr);
