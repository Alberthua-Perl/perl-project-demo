#!/usr/bin/perl

use 5.014;	# 注意Perl版本号
use warnings;
use strict;

my $original = 'Fred ate 1 rib';
# my $copy = $original;
# $copy =~ s/\d+ ribs?/10 ribs/;

# (my $copy = $original) =~ s/\d+ ribs?/10 ribs/;	# 先赋值，再替换
my $copy = $original =~ s/\d+ ribs?/10 ribs/r;		# 先替换，再赋值；模式匹配修饰符/r，保留替换后的字符串并赋值，而不是返回替换次数。
print $copy, "\n";