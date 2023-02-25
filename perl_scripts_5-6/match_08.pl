#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $str="ftp://ftp.uu.net/pub";
if(local ($first,$second)=$str=~m#^([^:]+)://(.*)#){
	{
		print "1 \$1 , \$2 =$first , $second\n";
		if(local ($first,$second)=$second=~m#^([^/]+)(.*)#){
			print "2 \$1 , \$2 =$first , $second\n";				}
		print "3 \$1 , \$2 =$first , $second\n";
	}
	print "4 \$1 , \$2 =$first , $second\n";	}
