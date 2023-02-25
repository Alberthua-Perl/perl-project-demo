#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

print "Please enter first character: ";
my $character1 = <STDIN>;
chomp $character1;
print "Please enter second character: ";
my $character2 = <STDIN>;
chomp $character2;
print "The icharacters satisfy these relationships:\n";if ( $character1 == $character2 ) {	#数字比较符：等于"=="与赋值"="严格区分
	print "$character1 is equal to $character2.\n";	}if ( $character1 != $character2 ) {
	print "$character1 is not equal to $character2.\n";	}
if ( $character1 < $character2 ) {
	print "$character1 is less than $character2.\n";	}if ( $character1 > $character2 ) {
	print "$character1 is greater than $character2.\n";
}
if ( $character1 <= $character2 ) {
	print "$character1 is less than or equal to $character2.\n";	}
if ( $character1 >= $character2 ) {
	print "$character1 is greater than or equal to $character2.\n";	}