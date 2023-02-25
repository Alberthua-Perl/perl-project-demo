#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $string1 = "_";
my $string2 = "this one has a 2";

number1( $string1 );number1( $string2 );
number2( $string1 );
number2( $string2 );
sub number1{
	my ($str)=@_;
	if($str=~/\w/){
		print "'$str' has a digit.\n";			}else{
		print "'$str' has no digit.\n";			}	}
sub number2{
	my $str=shift;
	if($str=~/[0-9]/){
		print "'$str' has a digit.\n";		
	}else{
		print "'$str' has no digit.\n";		
	}		}
