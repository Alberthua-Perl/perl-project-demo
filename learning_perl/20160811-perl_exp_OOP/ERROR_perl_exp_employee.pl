#!/usr/bin/perl

use warnings;
use strict;
use Employee;

my ($name, $extension, $address, $basepay, $employee);
print "Enter the employee's name: ";
chomp( $name = <STDIN> );
print "Enter the employee's phone extension: ";
chomp( $address = <STDIN> );
print "Enter the employee's address: ";
chomp( $address = <STDIN> );
print "Enter the employee's basepay: ";
chomp( $basepay = <STDIN> );

# Passing parameters as a hash
$employee = Employee->new( Name 	 => $name,
						   Address 	 => $address,
						   Extension => $extension,
						   PayCheck  => $basepay,
);
print "\nThe statistics for $name are: \n";
$employee->get_stats;