#!/usr/bin/perl

use warnings;
use strict;
# use Data::Dumper;

# Intermediate Perl p68 exc2

my (%total_bytes, %src_bytes);
while (<>) {
	chomp;
	next if (/^#/m);
	my ($source, $destination, $bytes) = split;
	$total_bytes{$source}{$destination} += $bytes;	# autovivification
	$src_bytes{$source} += $bytes;
}

for my $src ( sort { $src_bytes{$b} <=> $src_bytes {$a} 
	or $b cmp $a } keys %src_bytes ) {
	print "$src: $src_bytes{$src} bytes have been sent totally!\n";
	for my $des ( sort { $total_bytes{$src}{$b} <=> $total_bytes{$src}{$a}
		or $b cmp $a} keys %{ $total_bytes{$src} } ) {
		print "$src => $des: ", $total_bytes{$src}{$des}, " bytes\n";
	}
	print "\n";
}

# print Data::Dumper->Dump(
# 	[ \%total_bytes, \%src_bytes ],
#	[ qw(*total_bytes *src_bytes) ]
# );