#!/usr/bin/perl/

use 5.010;
use warnings;
use strict;

sub marine {
	state $n = 0;
	
	$n +=1;
	print "Hello,sailor number $n!\n";
}
 
 my $var = &marine;
 print $var,"\n";
 
 sub running_sum {
	state $sum = 0;
	state @numbers;
	
	foreach my $number (@_) {
		push @numbers, $number;
		$sum += $number;
	}
	say "The sum of (@numbers) is $sum";
}

running_sum (5,6);	# 直接调用子程序running_sum，不进行赋值操作
running_sum (1..3);
running_sum (4);