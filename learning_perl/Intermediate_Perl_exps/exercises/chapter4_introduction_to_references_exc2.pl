#!/usr/bin/perl

use warnings;
use strict;
# use Data::Dumper;

# Intermediate Perl p52 exercise 2

sub check_items_for_all {
	my $hash_ref = shift;
	my @required = qw( preserver sunscreen water_bottle jacket );
	
	my %ch_all = map {
		my $person = $_;
		$person => { map { $_ => 1 } @{ $hash_ref->{$person} } };
	} sort keys %{$hash_ref};
		# print Data::Dumper->Dump( [ \%ch_all ], [ qw(*ch_all) ] );
	
	for my $person ( sort keys %ch_all ) {
		for my $required (@required) {	
			unless ( $ch_all{$person}{$required} ) {
				push @{ $hash_ref->{$person} }, $required;
			}
		}	
	}
}

my @gilligan = qw( red_shirt hat luckey_socks water_bottle );
my @skipper = qw( blue_shirt hat jacket preserver sunscreen );
my @professor = qw( sunscreen water_bottle slide_rule batteries radio );

my %all = (
	Gilligan  => \@gilligan,
	Skipper   => \@skipper,
	Professor => \@professor,
);

check_items_for_all( \%all );

while ( my ($keys, $values) = each %all ) {
	print $keys, " : ", join "  ", @{$values}, "\n";
}
