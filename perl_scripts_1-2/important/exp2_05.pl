#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $num = 0;
my $add = 2;
$num += $num;	#双目赋值操作符：相当于$num = $num + $num；
print '$num =' ,$num,"\n";	#单引号内的标量变量被直接打印，不进行赋值运算，而单引号外的标量变量进行赋值运算
print 'Going to if structure:';
if($num < 10){	#条件表达式为真时，执行代码块
	$num += $add;	#相当于$num = $num + $add；
	print $num," true.\n";
}else{	#条件表达式为假时，执行代码块
	$num -= $add;
	print $num," faulse.\n";	}

unless($num > 10){	#条件表达式为假时，执行代码块，相当于else子句（if控制结构的相反情况）
	$num += $add;
	print "Entering unless:",$num,"\n";
}print $num > 10?'$num is great than 10':'$num is less than 10';
print "\n";
while($num < 10){	#while循环结构，只有条件为假时，才结束循环
	print "in while structure \$num =",$num,"\n";
	$num += $add;	}