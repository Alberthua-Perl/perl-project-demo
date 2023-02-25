#!/usr/bin/perl

use warnings;
use strict;

# This script is used to list the local perlmodule in win7 E:\Perl\lib.

eval {
	open INPUT, '<', 'perllocal.txt';
	open OUTPUT, '>', 'local_perlmodule.txt';
};
if ($@) {
	print "A Filehandle Error: $@!\n" 
}
my @localmod = ();
while (<INPUT>) {
	chomp;
	if (/^\s+\w+[\d\D]+"\s+(\S+)$/m) {
		push @localmod, $1;
	}
}
close INPUT;
print OUTPUT $_, "\n" foreach (sort @localmod);
close OUTPUT;