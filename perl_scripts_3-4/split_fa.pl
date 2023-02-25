#!/usr/bin/perl

use 5.006;
use strict;
use warnings;

my $in_file = shift;
my $num = shift;
my @a = ('XAA'..'XZZ');
my (%data,$w_fh);
open my $in_fh,'<',$in_file or die "Cannot open file:$!\n";

{
local $/ = "\n>";
while(<$in_fh>){
	chomp;	
	my $line = $_;
	$line = '>'.$line unless $. == 1;
	$line =~ s/\n$//;
	open $w_fh,'>>',$a[($.-1)/$num].'.out' or die "Cannot wirte file:$!\n";
	print $w_fh ($line,"\n");
	last if $. > 5000;
}		
}