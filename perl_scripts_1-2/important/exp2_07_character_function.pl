#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $str = "Hello World!";
print $str x 3,"\n";	#字符串的重复操作符
print 'Length is:',length $str,"\n";	#length函数返回字符串的长度（字符串的位数）
print 'uc: ',uc $str,"\n";	#uc函数将字符串全部改为大写
print 'lcfirst: ', lcfirst $str,"\n";	#lcfirst函数将字符串的第一个字符改为小写
print 'lc:', lc $str,"\n";	#lc函数将字符串全部改为小写
print 'ucfirst: ',ucfirst $str,"\n";	#ucfirst函数将字符串的第一个字符改为大写

my $str2 = reverse $str;
#reverse函数的参数为字符串，数组或列表，返回值为倒序的字符串，或倒序的数组或列表
print 'reverse: ',$str2,"\n";
$str =~ tr/a-zA-Z/A-Za-z/;	#绑定操作符与翻译操作符搭配使用，将原字符串的内容进行转换
print 'tr =~: ',$str,"\n";
my $count = $str =~ tr/a-z/A-Z/;	#转换操作符不使用正则表达式，转换的次数（标量上下文）
print 'tr =~ count: ',$count,"\n";
$str =~ tr/LL/M/s;	#修饰符s将相同的LL缩成一个
print 'tr =~:s ',$str,"\n";
$str =~ tr/M//d;	#修饰符d为删除所有指定字符，string2处无任何字符
print 'tr =~:d ',$str,"\n";
$str =~ tr/WO/a/c;	#修饰符c为翻译所有未指定的字符，包括空白符
print 'tr =~:c ',$str,"\n";

print "\$str:$str W:", (index $str,'W'),"\n";	#index函数查找子字符串在主字符串中第一个出现的位置
print "\$str:$str W:", (rindex $str,'W'),"\n";	#rindex函数查找子字符串在主字符串中最后出现的位置