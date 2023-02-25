#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $array = [ qw( There was an old lady who lived in a shoe... ) ];
my $hash = { "I'm a"  => " little tea cup",
			" short"=> " and stdout..." };
print( "@$array\n" );
print( %$hash, "\n" );
			
my $array2;			@$array2 = ( "Humpty", "Dumpty" );
$$array2[ 5 ] = "wall...";
$array2->[ 2 ] = "sat";
@$array2[ 3 , 4 ] = ( "on", "a" );
print( "@$array2\n" );
