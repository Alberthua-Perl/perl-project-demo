#!/usr/bin/perl

use warnings;
use strict;
use Storable qw(freeze thaw dclone);
use Data::Dumper;

## Storing Complex Data with Storable
# eval { open OUT_FH, '>', 'frozen_data.bin'; };
# my @data1 = qw(one won);
# my @data2 = qw(two too to);
# push @data2, \@data1;
# push @data1, \@data2;

# my $frozen = freeze [\@data1, \@data2];
# print OUT_FH $frozen;

# shallow copy
my @provisions = qw( hat sunscreen );
my @science_kit = qw( microscope radio );
push @provisions, \@science_kit;

# my $frozen = freeze \@provisions;		# deep copy
# my @packed = @{ thaw $frozen };
my @packed = @{ dclone \@provisions };	
	# 'dclone' could replace 'freeze' and 'thaw' subroutine in one step.

push @packed, 'blue_shirt';

push @{ $packed[2] }, 'batteries';

print Data::Dumper->Dump(
   [ \@provisions ],
   [ qw(*provisions) ]
);
print Data::Dumper->Dump(
   [ \@packed ],
   [ qw(*packed) ]
);

# YAML and JSON
use YAML;
use JSON;

my %total_bytes;

while (<>) {
	chomp;
	my ($source, $destination, $bytes) = split;
	$total_bytes{$source}{$destination} += $bytes;
}
print "YAML format: \n", Dump( \%total_bytes ), "\n\n";
print "JSON format: \n", to_json( \%total_bytes, { pretty => 1} );