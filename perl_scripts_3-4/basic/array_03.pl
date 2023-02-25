#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
my @array = qw( zero one two three four five six seven eight nine );
for my $i(@array){	# $_
	print $i,"\n";
	# $i = 0;	
}

my @new_array = @array[-2,-1];	#数组切片；负数数组索引值依次从右往左进行索引
print "@new_array\n";
# exit;
print "There are ", scalar(@array),
			" elements in \@array.\n";	#Perl忽略print函数中双引号外的空白符
print "The last index in \@array is $#array.\n\n";	#数组的最大索引值
print "\@array[$#array] is $array[$#array].\n\n";
print "\@array[-1] is $array[-1].\n";
print "\@array[-4] is $array[-4].\n\n";# exit;
# $#array = 5;print "\@array: @array.\n";
# $#array = 10; 
print "\@array: @array.\n";# exit;

my @array1 = ();	#空列表，无任何元素print "\@array1: @array1.\n";
print "There are now ", scalar(@array1), 
		" elements in \@array\n";
	my ($first,@array2,$second)  = 1..8;
#列表上下文，声明列表
#标量变量只能赋值一个值，而剩余全部赋值于数组，另一个标量变量为undef值
print "\$first = $first\n";
print "\@array2 = @array2\n";
print "\$second = $second\n";

{
my $first = () = ('a'..'g');	print "\$first = $first\n";
}
#裸块结构
#标量上下文；赋值操作符的右结合性

my @array3 = (1,2) x 3;	#等价于（1,2,1,2,1,2）
print "@array3\n";