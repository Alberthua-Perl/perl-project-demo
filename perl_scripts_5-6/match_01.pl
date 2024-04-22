#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $string = 'It is winter and there is snow on the roof.';
my $pattern = 'and';
print "String is: '$string'\n\n";

if( $string =~ m/snow/){	
	print "Found 'snow'\n";}
print "Found 'SNOW'\n" if $string =~ m/SNOW/;
print "Found 'on the'\n" if $string =~ m#on the#;
print "Found '$pattern'\n" if $string =~ /$pattern/;
print "Found '$pattern there'\n" if $string =~ m#$pattern there#;

## 从左到右## 第一个匹配开始
## 贪婪