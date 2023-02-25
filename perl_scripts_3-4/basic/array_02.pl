#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my @array;	# undef 声明数组变量，但不进行赋值
$array[0] = "happy";
print "@array\n";
#双引号内的数组变量内插 ，打印的数组元素间有空格相隔
#打印以换行符结尾的数组元素，注意在打印出来的每个元素间有换行符与水平制表符（\t）
$array[3] = "birthday";print "@array\n\n";
exit;

my $i;
for($i = 0; $i < 4; ++$i) {
	 if(!defined( $array[$i])) {
		 $array[$i] = "happy";		 	 }	}
#单目取反操作符：！，defined函数
print "@array\n";
print @array,"\n";
my @array1 = qw( this is an array of strings );
print "@array1\n\n";
my $total;	# undef
my @array2 = (1..6);	# ..:范围操作符
print $#array1,"\n";	#数组变量@array1的最大索引值
print scalar @array1,"\n";	#scalar函数：参数为数组或列表，返回值为元素个数（在标量上下文与列表上下文中理解）
for(my $i = 0;$i < $#array1;$i++){	
	$total += length $array1[$i];
	print $array1[$i-1],"\t",$total,"\n";	}
#双目赋值操作符：+=
# $#array1与@array2比较
my @array3 = (0..10);print "\n",@array3,"\n";