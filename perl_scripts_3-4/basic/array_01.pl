#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my @str = qw(hello,   world);	#逗号也被打印
for(@str){
	print $_ ,"\n";}
# exit;#for与foreach循环控制结构的差别，后者只用于数组的循环遍历
# print $str,"\n";	标量上下文（标量变量）

my @array = ("Hello", 283, "There",16.439);	# my @array = qw(Hello  283  There 16.439);
my $i = 0;
while($i < 4){
	print "$i   $array[$i]\n";
	$i++;}
#while与for，foreach循环控制结构的工作原理不同
#建立数组索引；$i++或++$i与循环控制结构搭配使用

$i = 0;for( $i = 0; $i < 4; ++$i ) {
	print "$i   $array[$i]\n";
}