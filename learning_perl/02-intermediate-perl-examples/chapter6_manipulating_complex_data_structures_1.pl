#!/usr/bin/perl

use warnings;
use strict;

use Data::Dumper;
use Data::Dump qw(dump);
use Data::Printer;

# There are three ways to dump the complex data structure included the nested array or hash
# for three different methods. The output of the data structure in the programme also can be 
# output into a file, so this process is called 'marshalling data'.


# Viewing Complex Data with Data::Dumper
# Marshalling Data
   # $Data::Dumper::Purity = 1;	# declare possible self-referencing structures
my @data1 = qw(one won);
my @data2 = qw(two too to);
push @data2, \@data1;
push @data1, \@data2;
print Dumper(\@data1, \@data2);	# Data::Dumper
print Data::Dumper->Dump(
   [ \@data1, \@data2  ],
   [ qw(*data1 *data2) ]
);

# Other Dumpers
my %total_bytes;
open IN_FH, '<', 'autovivification_and_hashes.txt'
	or die "Don't open the file: $!";
while (<IN_FH>) {
	chomp;
	my ($source, $destination, $bytes) = split;
	$total_bytes{$source}{$destination} += $bytes;
}
close IN_FH;
foreach my $source (sort keys %total_bytes) {
	foreach my $destination (sort keys %{ $total_bytes{$source} }) {
		print "$source => $destination:",
			" $total_bytes{$source}{$destination} bytes.\n";
	}
	print "\n";
}
dump (\%total_bytes);	# Data::Dump
p( %total_bytes );	# Data::Printer