#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my @opinions = qw( what word is being used most in this array is
			what this is used what most is is array what 
			word used is most is array what is this is array
			what is is array this is most );

my %hash;foreach ( @opinions ) {
	$hash{$_}++;
}
print "Word\tFrequency\n";
print "----\t---------\n";

foreach ( sort keys( %hash ) ) {
	print "$_\t", "*" x $hash{ $_ }, "\n";
}print "\nWord\tFrequency\n";
print "----\t---------\n";

foreach ( sort { $hash{ $b } <=> $hash{ $a } } keys( %hash ) ){
	print "$_\t", "*" x $hash{ $_ }, "\n";
}