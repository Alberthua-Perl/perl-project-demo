#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

#自增/自减操作符

my $c = 5;
my $d = 5;
print $c, "  ";	#标量变量在同一行打印，用空白符隔开，不换行
print $c++,"  ";	# $c先赋值，再自增，相当于$c = $c++
print $c, "\n";
print $d, "  ";
print ++$d,"  ";	# $d先自增，再赋值，相当于$d = ++$d
print $d,"\n";

