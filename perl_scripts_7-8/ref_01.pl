#!/usr/bin/perl

use 5.010;
use strict;
use warnings;


my $variable = 10;
my $reference = \$variable;
print ref $reference,"\n";
print  "\$variable = $variable\n"; 
print ( "\$reference = $reference\n" );print( "\$\$reference = $$reference\n" );
$variable++;print( "\$variable = $variable\n" );
print( "\$reference = $reference\n" );
print( "\$\$reference = $$reference\n" );
$$reference++;
print( "\$variable = $variable\n" );
print( "\$reference = $reference\n" );
print( "\$\$reference = $$reference\n" );
exit;
my $a=\10;
print $a,"\n";
