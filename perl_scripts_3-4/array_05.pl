#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my @array = (0..9);
my @reversed = reverse(@array);
print "Original:    @array\n";

my @array2 = (100,23,9,75,5,10,2,50,7,96,1,40);
my @sortedLexically = sort @array2;
my @sortedNumerically = sort {$b <=> $a} @array2;
print "Lexically:   @sortedLexically\n";

my @words=qw( zero one two three four five six seven eight nine );
my @wordsNumerically = sort {$a cmp $b} @words;
print "Unsorted:    @words\n";
print "Lexically:   @wordsLexically\n";
print "Numerically: @wordsNumerically\n";