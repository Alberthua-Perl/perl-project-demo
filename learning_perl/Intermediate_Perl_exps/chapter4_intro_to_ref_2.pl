#!/usr/bin/perl

use warnings;
use strict;

# That is one way to create hash structure.
my @number = (1,2,6,3,9,24,18);
my %var = grep $_ % 2 == 0, @number;	# Return list context
while ( my($key,$value ) = each %var ) {
	print "$key => $value\n";
}

# Modifying the Array
sub check_required_items {
	my $who = shift;
	my $items = shift;
	my %whos_items = map { $_,1 } @{$items};
	my @required = qw(preserver sunscreen water_bottle jacket);
	my @missing = ();
	foreach my $item (@required) {
		unless ( $whos_items{$item} ) {
			print "$who is missing $item.\n";
			push @missing, $item;
		}
	}	
	if (@missing) {
		print "Adding '@missing' to '@{$items}' for $who.\n";
		push @{$items}, @missing;
	}
	print "@{$items}\n\n";
}

# my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
# &check_required_items ("The skipper", \@skipper);


# Nested Data Structures
my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
my @skipper_with_name = ('Skipper', \@skipper);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @professor_with_name = ('Professor', \@professor);
my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
my @gilligan_with_name = ('Gilligan', \@gilligan);

my @all_with_names = (
	\@skipper_with_name,
	\@professor_with_name,
	\@gilligan_with_name,
);

# for my $person (@all_with_names) {	# 1
	# my $who = $$person[0];
	# my $provisions_reference = $$person[1];
	# &check_required_items($who,$provisions_reference);
# }

# for my $person(@all_with_names) {	# 2
	# &check_required_items(@$person);
# }

# &check_required_items(@$_) for @all_with_names;	# 3


# Simplifying Nested Element References with Arrows
my $root = \@all_with_names;
my $element1 = $root->[1]->[1]->[2];
my $element2 = $root->[1][1][2];
print $element1, ' ', $element2,"\n";
my @element = @{$root->[2][1]};
print "@element\n";


# Referencess to Hashes
my %gilligan_info = (
   name     => 'Gilligan',
   hat      => 'White',
   shirt    => 'Red',
   position => 'First Mate',
);
my %skipper_info = (
   name     => 'Skipper',
   hat      => 'Black',
   shirt    => 'Blue',
   position => 'Captain',
);
my @crew = (\%gilligan_info, \%skipper_info);

my $format = "%-15s %-7s %-7s %-15s\n";
printf $format, qw(Name Shirt Hat Position);
foreach my $crewmember (@crew) {
	printf $format,
		# $crewmember->{'name'},
		# $crewmember->{'shirt'},
		# $crewmember->{'hat'},
		# $crewmember->{'position'};
		@$crewmember{ qw(name shirt hat position)};		# a hash slices
}