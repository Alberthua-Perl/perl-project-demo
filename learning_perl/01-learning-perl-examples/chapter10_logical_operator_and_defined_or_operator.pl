#!/usr/bin/perl

use warnings;
use strict;

# logical operator
my $hour1;
if (($hour1 < 9)&&($hour1 = 17)) {	# 17
	print $hour1,"\n";
}
my $hour2 = 12;
if (($hour2 == 12)&&($hour2 = 17)) {	# 17
	print $hour2,"\n";
}
my $hour3 = 12;
if (($hour3 == 12)&&($hour3 > 17)) {	# Null
	print $hour3,"\n";
}
my $hour4 = 12;
if (($hour4 < 9)&&($hour4 = 17)) {	# Null
	print $hour4,"\n";
}
my $hour5 = 12;
if (($hour5 < 9)||($hour5 = 17)) {	# 17
	print $hour5,"\n";
}

# defined-or operator
use 5.010;
foreach my $path (keys %ENV) {	# List all key-value of %ENV
	print $path,"\t",$ENV{$path},"\n";
}
print "\n";

foreach my $try (0,undef,'0',1,25) {
	print "Trying [$try] ---> ";
	my $value = $try // 'default';
	say "\tgot [$value]";
}
print "\n";

my $name;
print "%s\n",$name // '';

# defined function
my $number;
if (defined $number) {
	print "True!\n";
} else {
	print "False!\n";
}

my $count = 5;
if (defined $count) {
	print "True!\n";
} else {
	print "False!\n";
}