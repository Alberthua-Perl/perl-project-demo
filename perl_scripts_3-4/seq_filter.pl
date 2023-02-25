#!/usr/bin/perl

use 5.006;
use strict;
use warnings;

my $usage = "USAGE: perl $0 input >output";
my $file = shift @ARGV or die "$usage\n";
my $out = shift;
my $limit = shift;
# $file = $ARGV[0];
# my $file = "DRR001105.fa";
open my $fh,'<',$file or die "Cannot open file:$!";
open my $w_fh,'>',$out or die "Cannot open file:$!";
{
local $/ = "\n>";
while(<$fh>){
	chomp;
	my $line = $_;
	$line ='>'.$line unless $. == 1;
	last if $. > 1000;
		# print $_,"\n";	
	# next;
	
	my (@line) = split /\n/,$line;
	# if($line[0]=~/contig/i){
		# print $w_fh $line,"\n";
		# next;
		# }
	
	my $length;
	for my $i(1..$#line){
		$length += length $line[$i];		
	}
	if ($length > $limit){
		print $w_fh  $line ,"\n" ;
	}
}
}