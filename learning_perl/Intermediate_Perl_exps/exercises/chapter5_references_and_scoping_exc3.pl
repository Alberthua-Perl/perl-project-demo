#!/usr/bin/perl

use warnings;
use strict;

# Intermediate Perl p69 exc3

my %total_bytes;
while (<>) {
	chomp;
	my ($source, $destination, $bytes) = split;
	$total_bytes{$source}{$destination} += $bytes;
}

for my $source ( sort keys %total_bytes ) {
	print $source, "\n";
	for my $destination ( sort keys %{ $total_bytes{$source} } ) {
		print "\t", $destination, " ", $total_bytes{$source}{$destination}, "\n";
	}
}