#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $num = 10.1;
print int $num,"\n";

my $i = 0;
while($i < 5){
	my $new_num = rand(10);
	print 'The random number is ',$new_num,". int:",int $new_num, ". Round:",int $new_num + 0.5,"\n";
	$i++;	
}
{
srand;
my $i = 0;
while($i < 5){
	my $new_num = rand(10);
	print 'The random number is ',$new_num,". int:",int $new_num, ". Round:",int $new_num + 0.5,"\n";
	$i++;	
}
srand;
print "Take a look of how srand work:\n";
$i = 0;
while($i < 5){
	my $new_num = rand(10);
	print 'The random number is ',$new_num,". int:",int $new_num, ". Round:",int $new_num + 0.5,"\n";
	$i++;	
}
}

printf "%d\n", 455.954;
printf "%d\n", +455.34;
printf "%d\n", -455;
printf "%o\n", 455;
printf "%u\n", 455;
printf "%u\n", -455;
printf "%x\n", 455;
printf "%x\n", -455;
my $aa = sprintf "Total: %20.2f .\n", 455.954;
print $aa;