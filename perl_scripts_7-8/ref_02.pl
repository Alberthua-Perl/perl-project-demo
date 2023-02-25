#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my @array = qw( duck pig horse rooster cow );
my %hash = ( duck    => "quack",
			pig     => "oink",
			horse   => "neigh",
			rooster => "cock-a-doodle-doo",
			cow     => "moo" );
my $arrayReference = \@array;
my $hashReference = \%hash;
sub returnReference{
	return \@array;	}

print( "@$arrayReference\n" );
print( "\$\$arrayReference[ 1 ] = $$arrayReference[ 1 ]\n" );print( "\$arrayReference->[ 1 ] = $arrayReference->[ 1 ]\n" );
print ( "\${returnReference()}[ 1 ] = ${returnReference()}[ 1 ]\n\n" );
print( "\$\$hashReference{ duck } = $$hashReference{ duck }\n" );
print ( "\$hashReference->{ duck } = $hashReference->{ duck }\n\n" );
foreach ( keys( %$hashReference ) ) {
	print( "The $_ goes $hashReference->{ $_ }.\n" );
	}
