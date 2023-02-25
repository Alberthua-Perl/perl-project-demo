#!/usr/bin/perl

use 5.010;
use strict;
# use warnings; 由于程序会定义undef值，关闭警告信息

my $string = 'Top 10';	#单引号内的字符串及赋值
my $number = 10.0;	#数值
print "Number is \"$number\" and string is \"$string\". \n\n";
#双引号内的变量内插，若表示双引号本身需在前面进行反斜线转义;双引号内变量只能进行赋值运算。

my $add = $number + $string;
#数字运算符：数值加和运算，字符串转化为数字0（何种运算取决于运算符类型）
#若字符串开头为数字就取数字部分，后面的字符串转为0
print "Adding a number and a string:       \"$add\".\n";

my $concatenate = $number . $string;	#连接操作符：字符串连接，数值转化为字符串
print "Concatenating a number and a string: \"$concatenate\".\n";

my $add2 = $concatenate + $add; 
print "Adding the previous two results:     \"$add2\".\n";	#打印双引号内的空白符

my $undefNumber;   #标量变量声明，可不进行赋值（数组，哈希，子程序同样可声明不赋值或调用）
my $undefAdd = 10 + $undefNumber;
print "Adding 10 to an undefined variable:  \"$undefAdd\"\n";

my $undefVariable;
print "Printing an undefined variable:      \"$undefVariable\"(end)\n";	#undef值对应空串“”（null），不是空白符