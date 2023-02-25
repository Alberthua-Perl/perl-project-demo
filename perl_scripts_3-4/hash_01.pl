#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my %presidents = ( George => "Washington",
				   Abe    => "Lincoln",
				   Thomas => "Jefferson",
				   Harry  => "Truman" );
# my %presidents = ( 'George',"Washington",
				   # 'Abe',"Lincoln",
				   # 'Thomas' , "Jefferson",
				   # 'Harry' , "Truman" );			
my @keys = keys(%presidents);
while(my $key = pop(@keys)){
	print "$key => $presidents{$key}\n";	}

my @values = values(%presidents);
print "\nThe values of the hash are:\n@values\n\n";

print "%presidents with its keys and values reversed\n";
my %hash = reverse(%presidents);
while(my ($key,$value) = each(%presidents)){
	print "$key => $value\n";	}