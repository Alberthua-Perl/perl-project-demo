#!/usr/bin/perl

use warnings;
use strict;

# This script is used to calculate factorial by subroutine recursion.

sub f {
	my $num = shift;
	if ($num == 1) {
		return 1; 
	} else {
		return $num * &f ($num - 1);
	}
}

my $factorial = &f (10);
print $factorial, "\n";