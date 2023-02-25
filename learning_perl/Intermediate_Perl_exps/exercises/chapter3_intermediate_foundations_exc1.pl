#!/usr/bin/perl

use warnings;
use strict;

# Intermediate Perl p33 exercises 1

my @filelist = grep { (-s $_) < 1000 } @ARGV;
	# print "The file is: ", @filelist, "\n";
my @resultlist = map { ( " " x 4 ).$_."\n" } @filelist;
print "The result list is: ", @resultlist, "\n";