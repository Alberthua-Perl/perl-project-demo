#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my @array;
for(my $i = 1; $i <= 5; ++$i){
	push(@array,($i)); 
	print "@array\n";}
# push函数：对目标数组的末尾进行操作，增加标量变量或数组变量到目标数组中，返回列表上下文

my $firstTotal;
while(@array){
	$firstTotal += pop(@array);
	print "@array\n"; 
}print "\$firstTotal = $firstTotal\n\n";
#可作为计算数组元素之和的子程序
#数组变量可直接作为while循环控制结构的条件表达式
#循环控制结构：while，until，for，foreach，条件表达式包括：标量变量、数组变量、文件句柄、一般表达式等，只有前面分别返回undef、空数组()、
#文件末尾（end-of-file，undef）、条件表达式返回布尔值时，才能跳出循环语句。
# pop函数：取出数组末尾的元素作为返回值，标量上下文

for(my $i = 1; $i <= 5; ++$i){
	unshift(@array,$i);
	print "@array\n";}
# unshift函数：对目标数组的开头进行操作，增加标量变量或数组变量到目标数组中，返回列表上下文
my $secondTotal;while(@array){
	$secondTotal += shift(@array);
	print "@array\n";	}
print "\$secondTotal = $secondTotal\n";
# shift函数：取出数组开头的元素作为返回值，标量上下文

@array = (0..20);my @array2 = ('A'..'F');
print "\@array:  @array\n";
print "\@array2: @array2\n\n";
my @replaced = splice(@array,5,scalar(@array2),@array2);	# splice函数分割数组（4个参数），与split函数（模式匹配处理字符串）相区别
print "replaced:     @replaced\n",
	"with:         @array2\n",
	"resulting in: @array\n\n";
my @removed = splice(@array,15,3);
	print "removed:      @removed\n",
        "leaving:      @array\n\n";
my @chopped = splice(@array,8);
print "removed:      @chopped\n",
	"leaving:      @array\n\n";
splice(@array);		# splice函数的参数只有目标数组时，去除所有元素，返回空数组()；只使用函数，不赋值
unless (@array){
	print "\@array has no elements remaining\n";}