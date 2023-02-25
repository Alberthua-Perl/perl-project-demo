#!/usr/bin/perl

use 5.006;
use strict;
use warnings;

my $string="20S30M5D50M3I33M";

my @array=split /[A-Z]/,$string;
print "\@array:@array \n";

my $new_string;
for my $value(@array){
	print $value,"\n";
	$new_string .= $value.' ' if $value >20;
}

print '$new_string: ',$new_string,"\n";

print join( " ",grep $_ >20,@array),"\n";

my @array2=split /([A-Z]+)/,$string;
print "\@array2: ",scalar @array2,':',join("+++",@array2),"\n";
my $new_string2;
for (my $i=0;$i<=$#array2;$i++){
	print $array2[$i],"\n";
	$new_string2.= $array2[$i].$array2[$i+1] if $array2[$i+1] ne 'D';
	$i++;
}

print $new_string2,"\n";