#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my @array;
for my $outer(0..3){
	for my $inner(0..3){
		$array[ $outer ][ $inner ] = $outer * $inner;			}	}
foreach ( 0 .. $#array ) {
	$array[ $_ ]->[ 4 ] = $_ * 4;
}print( "@array\n" );
push( @array, [ 0, 4, 8, 12, 16 ] );
print( "\$array[ 1 ]->[ 3 ] = $array[ 1 ]->[ 3 ]\n" );print( "\$array[ 2 ][ 3 ] = $array[ 2 ][ 3 ]\n" );
print( "\@\$array[ 1 ] = @{$array[ 1 ]}\n\n" );
for my $outer(0.. $#array){
	for my $inner(0.. $#{$array[$outer]}){
		print $array[$outer][$inner],"\t";
			}
	print "\n";}