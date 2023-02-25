#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $string = "hello there\n";
print "The original string: ", 'hello there\n', "\n\n";		# Using substr
print "Using substr with the string and the offset (2): ";
print substr( $string, 2 );
print "Using substr with the string, offset (2) and length (3):";
print "Using substr with offset (-6), and length (2): ";
print substr( $string, -6, 2 ), "\n";
print "Using substr with offset (-6) and length (-2): ";
print substr( $string, -6, -2 ), "\n\n";
# replace first 5 characters of $string with "bye"
# assign substring that was replaced to $substring

my $substring = substr( $string, 0, 5, "Bye" );
print "The string after the replacement: $string";
$string = uc( $string );
print "Uppercase: $string";
$string = lc( $string );