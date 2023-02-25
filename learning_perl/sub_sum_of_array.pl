#!/usr/bin/perl

use warnings;
use strict;

# Use the sub to calculate the sum of all elements of an array.

sub sum_of_array {
	my $sum;
	
	foreach my $count (@_) {
		$sum += $count;
	}
	return $sum;
}

my @sum = 1..5;
my $sum1 = &sum_of_array (@sum);
print "$sum1\n";