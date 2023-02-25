#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

my $functionReference = \&function;
&$functionReference( "a", "bunch", "of", "words" );
$functionReference->( "some", "other", "words" );
sub function{
	
	print( "I have been called with @_ as arguments.\n" );}

