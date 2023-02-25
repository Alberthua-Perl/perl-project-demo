#!/usr/bin/perl

use warnings;
use strict;
# use autodie;	# 5.010 version

# This script is used to replace 'BS' in perldoc from Linux command line.

eval { open OUTPUT, '>', $ARGV[0]. '.bak' };
print "ERROR: $@!\n" if ($@);
while (<>) {
	chomp;
	s/(\w)[^\n]\g{1}/$1/g;
	s/_[^\n]/_/g;
	s/-[^\n]/-/g;	# '->' could be replaced by '-'!
	print OUTPUT $_, "\n";
}
close OUTPUT;
