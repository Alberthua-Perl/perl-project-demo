
#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my @numbers = (1..10);
print "\@numbers: @numbers\n\n";

my @smallNum;for(@numbers){
	push @smallNum,$_ if $_<6;	}
print "Numbers less than 6:\n","foreach: @smallNum\n";
my @smallNumbers2 = grep($_ < 6, @numbers);print "grep:    @smallNumbers2\n\n";
# exit;
my @doubledNumbers;
foreach (@numbers) {
	push(@doubledNumbers,$_ * 2);
}print "Double each number:\n",
	"foreach: @doubledNumbers\n";
my @doubledNumbers2 = map($_ * 2,@numbers);
print "map:     @doubledNumbers2\n\n";
