#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

OUTER: foreach my $row(1..10){
	INNER: foreach my $column(1..10){
				if( $row <$column ) {
					print "\n";
					next OUTER;
					# next;							}		
		   print "$column   ";		   }
  # print "\n";}