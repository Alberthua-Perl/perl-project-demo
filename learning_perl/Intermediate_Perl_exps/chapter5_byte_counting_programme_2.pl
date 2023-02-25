#!/usr/bin/perl

use warnings;
use strict;

# Using the Debugger to View Complex Data

# At first, we have used 'perl -d chapter5_byte_counting_programme_2.pl < autovivification_and_hashes
# on DOS command line.

# Autovivification and Hashes
# open INFO_FH, '<', 'autovivification_and_hashes.txt'
	# or die "Don't open the file: $!";
my %total_bytes;
while (<>) {
	chomp;
	my ($source, $destination, $bytes) = split;
	$total_bytes{$source}{$destination} += $bytes;
}
foreach my $source (sort keys %total_bytes) {
	foreach my $destination (sort keys %{ $total_bytes{$source} }) {
		print "$source => $destination:",
			" $total_bytes{$source}{$destination} bytes.\n";
	}
	print "\n";
}
# close INFO_FH;

 # The actual data structure of this example is following:
		# my %total_bytes = (
			# professor.hut 		=> { gilligan.crew.hut   => '1250',
									 # lovey.howell.hut    => '2314',
									 # laser3.copyroom.hut => '2924',
								   # },
			# thurston.howell.hut => { lovey.howell.hut 	 => '2230', },
			# ginger.girl.hut 	=> { professor.hut 		 => '2448',
									 # maryann.girl.hut    => '199',		
								   # },		
	   # );