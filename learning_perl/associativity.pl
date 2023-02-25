#!/usr/bin/perl

use warnings;
use strict;

# 操作符结合性：赋值操作符（运算符）' = '的右结合性高于' *=，+= '，都是从右往左进行运算

{
   my $var_1 = 3;
   my $var_2 = 2;
   $var_1 *= $var_2 += 5;
   print $var_1,"\n";	# 输出21
}

{
   my $var_1 = 3;
   my $var_2 = 2;
   ($var_1 *= $var_2) += 5;
   print $var_1,"\n";	# 输出11
}