#!/usr/bin/perl	#程序运行及基本组成，语句组成

use 5.010;
use strict;
use warnings;

#Perl允许自由的语言环境，而Python中较严谨
#同一种结果的不同实现方式

print ( "1. Welcome to Perl!\n" );
print "3. Welcome ", "to ", "Perl!\n";
print "4. Welcome ";	#末尾不加换行符，在同一行打印
print "5. Welcome to Perl!\n";
print "7. Welcome  
	to Perl.\n";