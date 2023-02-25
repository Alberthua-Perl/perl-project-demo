#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $string1 = "madam im adam";
my $string2 = "the motto means something";
my $string3 = "no palindrome here";
findPalindrome( $string1 );findPalindrome( $string2 );
findPalindrome( $string3 );
sub findPalindrome{
	my $string = shift;
	if ( $string =~
	/(\w)\W*(\w)\W*(\w)\W*(\w)\w*\4\W*\3\W*\2\W*\1/	or $string =~
	/(\w)\W*(\w)\W*(\w)\W*(\w)\W*\3\W*\2\W*\1/ ) {
		 print "$string - ",
		 "has a palindrome of at least 7 characters.\n";		}else{
			print "$string - has no long palindromes.\n";					}}


