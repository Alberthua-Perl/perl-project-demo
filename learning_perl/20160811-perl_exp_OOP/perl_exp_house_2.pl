#!/usr/bin/perl

use warnings;
use strict;
use House;

my $house1 = House->new( "Tom Savage", 250000, "T");
my $house2 = House->new( "Devin Quigley", 55000, "D" );
$house1->display_object;
$house2->display_object;
print "$house1, $house2\n";

my $house = House->new( "Tom Savage", 250000, "Cape Cod" );
$house->display( "Owner", "Style" );