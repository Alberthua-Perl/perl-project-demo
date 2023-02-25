#!/usr/bin/perl	#程序运行及基本组成，语句组成

use 5.010;
use strict;
use warnings;

#Perl允许自由的语言环境，而Python中较严谨
#同一种结果的不同实现方式

print ( "1. Welcome to Perl!\n" );print     "2. Welcome to Perl!\n"       ;	#print函数只打印双引号内的内容，忽略双引号外的空白符
print "3. Welcome ", "to ", "Perl!\n";
print "4. Welcome ";	#末尾不加换行符，在同一行打印print "to Perl!\n";
print "5. Welcome to Perl!\n";print "6. Welcome\n   to\n\n   Perl!\n";	#注意，print函数打印双引号内的空白符（不忽略）
print "7. Welcome  
	to Perl.\n";