#!/usr/bin/perl

use warnings;
use strict;

my @required = qw(preserver sunscreen water_bottle jacket);
my %skipper = map { $_,1 } qw(blue_shirt hat jacket preserver sunscreen);
foreach my $item (@required) {
	unless ( $skipper{$item} ) {
		print "Skipper is missing $item.\n";
	}
}

sub check_required_items {
	my $who = shift;
	# my $items = shift;
	my %whos_items = map { $_, 1} @_;
	# my %whos_items = map { $_, 1 } @{$items};
	
	my @required = qw(preserver sunscreen water_bottle jacket);
	
	for my $item (@required) {
		unless ( $whos_items{$item} ) {
			print "$who is missing $item.\n"
		}
	}
}
my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
&check_required_items ('gilligan', @gilligan);
# &check_required_items ('gilligan', \@gilligan);