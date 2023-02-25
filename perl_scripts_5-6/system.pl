#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $a=system("dir \$HOME");

print"++$a++";