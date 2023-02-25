#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

print "Please enter first integer: ";	#输入整数，打印双引号内的空白符，不换行
my $number1 = <STDIN>;
chomp $number1;		#函数（操作符）具有参数和返回值；chomp函数去除字符串末尾的换行符，若下文使用该变量，则不会换行
print "Please enter second integer: ";
my $number2 = <STDIN>;
chomp $number2;
print "The integers satisfy these relationships:\n";if ( $number1 == $number2 ) {	#数字比较符：等于；数值的等于“==”与赋值“=”严格区分
	print "$number1 is equal to $number2.\n";	}if ( $number1 != $number2 ) {	#条件判断：if控制结构，条件表达式若为真，继续执行，若为假，跳出条件判断
	print "$number1 is not equal to $number2.\n";	}
if ( $number1 < $number2 ) {
	print "$number1 is less than $number2.\n";	}if ( $number1 > $number2 ) {
	print "$number1 is greater than $number2.\n";
}
if ( $number1 <= $number2 ) {
	print "$number1 is less than or equal to $number2.\n";	}
if ( $number1 >= $number2 ) {
	print "$number1 is greater than or equal to $number2.\n";	}