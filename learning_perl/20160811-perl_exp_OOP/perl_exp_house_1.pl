#!/usr/bin/perl

# package main;
use warnings;
use strict;

my $ref = {
	Owner => 'Tom',
	Price => '25000',
};	# reference of the data structure: object
print "The reference of the data structure called object.\n   Its memory address is ", $ref, "\n";

bless $ref;
print "The bless function tags the hash with its package name.\n";
print "   The reference of \$ref(object) is: $ref.\n";
print "The ref function returns the class(package) name: ", ref $ref, "\n";

# 1;
# __END__