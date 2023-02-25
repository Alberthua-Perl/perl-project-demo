#!/usr/bin/perl

# Example: OOP in Perl

use warnings;
use strict;
use Person;

my $object = Person->new('Xiao_Ming', 'Wang', 23234345);
my $firstName = $object->getFirstName();
print "Before setting the name: ", $firstName, "\n";	# Xiao_Ming

$object->setFirstName('Xiao_Qiang');	# Xiao_Qiang
$firstName = $object->getFirstName();
print "After setting the name: ", $firstName, "\n";	# Xiao_Qiang