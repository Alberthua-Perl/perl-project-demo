#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $string1 ="Hello there. Nothing here. There could be something here.";
my $string2 = $string1;
print "\$string1:$string1\n";
$string1 =~ s/N.*here\.//;print "\$string1:$string1\n";
print "$string2\n";$string2 =~ s/N.*?here\.//;
print "\$string2:$string2\n\n";