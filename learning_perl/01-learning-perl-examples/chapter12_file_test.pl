#!/usr/bin/perl

use warnings;
use strict;

# file testing operator
chomp (my $filename = <STDIN>);
if ( -e $filename) {
	print "There is the same file on desktop!\n";
} else {
	print "No file!\n";
}

my $other_file = 'perlport.txt';
print "The file is readable!\n" if -r $filename;
sub lookup {
	return -w $_[0];
}
lookup( $other_file );
print "The file is writable!\n" if -w _;

# stat function
my $file = 'crew_provisions_list.txt';
my @filelist = stat $file;
print "@filelist\n";