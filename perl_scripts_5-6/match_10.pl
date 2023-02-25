#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $str="Hello World . :-)";
my $test=":-)";
$test=quotemeta $test;

if($str=~/$test/){
	print "\$str:++$str++ matches \$test:++$test++\n";
}else{
	print "\$str DOES NOT matches \$test\n";
}

