#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $str=<<'HERE';
This's is a Line_a
That is another Line_b
And a final Line_c
HERE

my @match=$str=~/^\w+/g;print "First Matches:++@match++ .contain :",scalar @match," elements\n";
my @match2=$str=~/^\w+/mg;
print "First Matches:++@match2++ .contain :",scalar @match2," elements\n";
# exit;
# my $test=q(This's a "word" boundary.);# (my $btest=$test)=~s/\b/:/g;
# (my $Btest=$test)=~s/\B/:/g;
# print "$btest\n$Btest\n";
# exit;
while($str=~/^(\w+)
	/mgx){
	print $1,"\n";
	}