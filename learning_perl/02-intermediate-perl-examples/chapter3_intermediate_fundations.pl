#!/usr/bin/perl

use warnings;
use strict;

# map function
my @input_numbers = (1, 2, 4, 8, 16, 32, 64);
my @result = map {
   my @digits = split //, $_;
   if ($digits[-1] == 4) {
		@digits;
   } else {
		( );
   }
} @input_numbers;
print "@result\n";

# eval whose parameter is a string expression
my $sum;
eval '$sum = 2 + 2';
print "The sum is $sum.\n";