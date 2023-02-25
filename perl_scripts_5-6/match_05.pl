#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $string = "11000";
change1( $string );
change2( $string );
change3( $string );

$string = "1010001";
change1( $string );
change2( $string );
change3( $string );

	my $string = shift();
	print "  Original string: $string\n";
	$string =~ s/1\d*1/22/;
	print "After s/1\\d*1/22/: $string\n\n";

sub change2{
	my $string = shift();
	print "  Original string: $string\n";
	$string =~ s/1\d+1/22/;
	print "After s/1\\d+1/22/: $string\n\n";
}

	my $string = shift();
	print "  Original string: $string\n";
	$string =~ s/1\d?1/22/;
	print "After s/1\\d?1/22/: $string\n\n";
}