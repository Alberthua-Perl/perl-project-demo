#!/usr/bin/perl

use 5.006;
use strict;
use warnings;

my $file="group2.group1.coords";
open my $fh,'<',$file or die "Cannot open file:$file $!\n";
open my $w_fh,'>',$file.'.xls' or die "Cannot open file:$file $!\n";
while(<$fh>){
	chomp;
	s/\s+\|\s+/\t/g;
	if(/^\s+\S+/){
		s/^\s+//;
		s/(\d)\s+/$1\t/g;
		s/\s+(\[)/\t$1/g;
		print $w_fh $_,"\n"
	}
}