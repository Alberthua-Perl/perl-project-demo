#!/usr/bin/perl
# 
# use perl ExtUtils::Installed module applied by perl-ExtUtils-Install
# package to list just in current user env

use warnings;
use strict;
use ExtUtils::Installed;

my $inst = ExtUtils::Installed->new();
print join "\n", $inst->modules();
print "\n";

