# Scalar Array Hash
#
# Scalar 
my $animal = "camel";
my $answer = 42;

print $animal, "\n";
print "The animal is $animal\n";
print "The square of $answer is ", $answer * $answer, "\n";
print; # prints contents of $_ by default

# Array
my @animals = ("camel", "llama", "owl");
my @numbers = (23, 42, 69);
my @mixed = ("camel", 42, 1.24);

# 0 index
print $animals[0], "\n";
print $animals[2], "\n";

# $# -- the last elements index in array 
print $mixed[$#mixed],"\n";
print @animals, "\n";
print @animals[0,1], "\n";

# sort and reverse are perl's built-in function
my @sorted = sort @animals;
my @backwards = reverse @numbers;

print @sorted, "\n";
print @backwards, "\n";

