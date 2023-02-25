#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $string = "Hello to the world";

print "The original string is: \"$string\"\n";
$string =~ s/world/planet/;
print "s/world/planet/ changes string: $string \n";

$_ = $string;
print "The original string is: \"$_\"\n";
s/planet/world/;
print "s/planet/world/ changes string: $_ \n";
print "s/planet/world/ changes string: $string \n";
print "The original string is: \"$_\"\n";
s(world)(planet);
print "s(world)(planet) changes string: $string \n";
$string = "This planet is our planet.";
print "$string\n";
my $matches = $string =~ s/planet/world/g;
print "$matches occurrences of planet were changed to world.\n";
print "The new string is: $string\n";



