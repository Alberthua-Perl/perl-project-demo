#!/usr/bin/perl

# Example: OOP in Perl

use warnings;
use strict;
use Person;
use Data::Dumper;

my $object = Person->new('Xiao_Ming', 'Wang', 23234345);
print Dumper( $object ), "\n";
my $firstname = $object->getFirstName();
print "Before setting the name: ", $firstname, "\n";

$object->setFirstName('Xiao_Qiang');
$firstname = $object->getFirstName();
print "After setting the name: ", $firstname, "\n";
