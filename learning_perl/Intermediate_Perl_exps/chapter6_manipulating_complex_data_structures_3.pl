#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;
use YAML qw(Dump);

# Using the map and grep Operators
	# Applying a Bit of Indirection 
my @input_number = (1, 2, 4, 8, 16, 32, 64);
my @indices_of_odd_digit_sums = grep {	# Indirection
	my $number = $input_number[$_];
	my $sum;
	$sum += $_ for split //, $number;
	$sum % 2;
} 0..$#input_number;

	# my @odd_digit_sums = grep {
		# my $sum;
		# $sum += $_ for split //, $_;
		# $sum % 2;	
	# } @input_number;
	
my @odd_digit_sums = @input_number[ @indices_of_odd_digit_sums ];
print "\@indices_of_odd_digit_sums: @indices_of_odd_digit_sums\n";
print "\@odd_digit_sums: @odd_digit_sums\n";

# Selecting and Altering Complex Data
my %provisions = (
	'The Skipper'   => [qw(blue_shirt hat jacket preserver sunscreen)        ],
	'The Professor' => [qw(sunscreen water_bottle slide_rule batteries radio)],
	'Gilligan'      => [qw(red_shirt hat lucky_socks water_bottle)           ],
);

	# Who brought a water bottle?
my @all_wet = grep {
	my @items = @{ $provisions{$_} };
	grep $_ eq 'water_bottle', @items;
} keys %provisions;
print "@all_wet\n";

	# Turn a hash into a list of array references
my @remapped_list = map {
	[ $_ => $provisions{$_} ];	# '=>' is a special ','
} keys %provisions;
print Data::Dumper->Dump( [ \@remapped_list ], [ qw(*remapped_list) ] ), "\n";

my @person_item_pairs = map {
	my $person = $_;
	my @items = @{ $provisions{$person} };
	map [ $person => $_], @items;
} keys %provisions;
print Dump( \@person_item_pairs ), "\n";