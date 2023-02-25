#!/usr/bin/perl

use 5.010;
use warnings;
use strict;

# 在foreach循环中修改控制变量的值，即修改了列表元素，循环结束后列表被修改

my @list = (2,3,4);
foreach my $word (@list) {
	$word = 5 if $word == 4;
	print $word, " ", "\n";
}

my @rocks = qw/ bedrock slate lava /;
foreach my $rock (@rocks) {
	$rock = "\t$rock";
	$rock .= "\n";
}
print "\nThe rocks are:\n", @rocks;