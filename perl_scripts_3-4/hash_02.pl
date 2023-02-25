#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my %hash = ( George => "Washington",
			 Abe    => "Lincoln",
			 Thomas => "Jefferson",
			 Harry  => "Truman" );
my @hashKeys = keys(%hash);
for(my $i = 0; $i < @hashKeys; ++$i){
	 print "$hashKeys[$i] => $hash{$hashKeys[$i]}\n";	}
delete($hash{'Abe'});
while(my $key = pop(@hashKeys)){
	print "\n";
	if(exists($hash{$key})){
			print "$key exists in the hash.\n";
		}else{
			print "$key doesn't exist in the hash.\n";						}
	if (defined($hash{$key})){
		print "$key is defined as $hash{ $key }.\n";
		}else{
			print "$key is undefined.\n";
		}
	if($hash{$key}){
		print "$key is true.\n";			}else{
		print "$key is false.\n";			}}