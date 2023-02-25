#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $string1 = "i think we should stop";
my $string2 = "lets continue";
my $string3 = "i don't want to end";
finish( $string1 );finish( $string2 );
finish( $string3 );
sub finish{
	my $string = shift();
	print "$string\n";
	if ( $string =~ /stop|quit|end/ && 
		$string !~ /not|don't/ ) {
			print "alright, we're finished.\n";								}else{
			print "ok, lets keep going.\n";					}	}
