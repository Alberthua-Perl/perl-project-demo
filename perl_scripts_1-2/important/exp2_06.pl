#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

print "Please enter something: ";	# my $in = <STDIN>;
my $in = '';	#单引号圈引标量变量	
# chomp $in;
#单引号内的空字符串（null），undef值
#声明但未赋值的标量变量，空字符串（null），空数组均返回undef值

if($in){	
	print '$in ++', $in,'++ is true.',"\n";}else{
	print '$in is faulse.',"\n";	}
exit;
#条件表达式可以是最简单的标量变量，也可以是复杂的表达式，返回的真假值所执行的代码块也不同
#打印单引号内的内容（不包括单引号）,标量变量本身也被打印，但不赋值
#双引号内的变量及引号以外的变量会被赋值，双引号内反斜线转义的变量不赋值

my $out = '';
if($in and $out){
	print "\$in and \$out : true\n";	
}elsif($in || $out){	
	print "\$in or \$out i: true\n";
}else{
	print "\$in and \$out : both faulse\n";
}
# and操作符，"||"为or（或）操作符，注意操作符间的优先级