#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

opendir my   $d_fh,'.' or die  "Cannot open dir: .\n";

while(my $file=readdir $d_fh){
	
	print $file,"\n";}
my @files=<*.pl>;
print "\n\nglobbing:\n\n @files \n";