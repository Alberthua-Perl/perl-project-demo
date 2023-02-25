#!/usr/bin/perl

use 5.006;
use strict;
use warnings;

open my $fh,"dir |" or die "Cannot open pipe:$!\n";
open my $fh,"perl array_01.pl |" or die "Cannot open pipe:$!\n";
while(<$fh>){
	print $.,"\t",$_ ;
}
# my @array=<$fh>; ##上下文

while(<$fh>){
	print $.,"\t", $_;
}
# exit;

close($fh);
open $fh,"dir |" or die "Cannot open pipe:$!\n";
while(<$fh>){
	print $.,"\t",$_ ;
}
close($fh);