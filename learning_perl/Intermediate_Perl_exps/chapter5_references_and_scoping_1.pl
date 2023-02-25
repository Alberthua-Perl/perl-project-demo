#!/usr/bin/perl

use warnings;
use strict;

# Reference Counting and Nested Data Structures
sub get_provisions_list {
   my @skipper = qw(blue_shirt hat jacket preserver sunscreen);
   my @skipper_with_name = ('The Skipper', \@skipper);

   my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
   my @professor_with_name = ('The Professor', \@professor);

   my @gilligan = qw(red_shirt hat lucky_socks water_bottle);
   my @gilligan_with_name = ('Gilligan', \@gilligan);

   return (
     \@skipper_with_name,
     \@professor_with_name,
     \@gilligan_with_name,
   );
}

sub get_provisions_list_1 {
	return (
		[ 'The Skipper',   [qw(blue_shirt hat jacket preserver sunscreen)]        ],
		[ 'The Professor', [qw(sunscreen water_bottle slide_rule batteries radio)]],
		[ 'Gilligan',      [qw(red_shirt hat lucky_socks water_bottle)]           ],
	);
}

my @all_with_names = get_provisions_list ( );
print "@all_with_names\n";	# print the memory address of the values of return in subroutine.
my @all_with_names_1 = get_provisions_list_1 ( );
print "@all_with_names_1\n";

# Creating an Anonymous Hash
my @crew = (
   {
    name 	 => 'Gilligan',
	hat 	 => 'White',
	shirt 	 => 'Red',
	position => 'First Mate',
   },
   {
    name 	 => 'Skipper',
	hat 	 => 'Black',
	shirt 	 => 'Blue',
	position => 'Captain',
   },
);
print "@crew\n";

# Autovivification
my %provisions;
my $person;

open IN_FH, '<', 'crew_provisions_list.txt'
	or die "Don't open the file on the Desktop: $!";
while (<IN_FH>) {
	chomp;
	if (/^(\S.*)/) {
		$person = $1;
		# $provisions{$person} = [ ] unless $provisions{$person};	# autovivification
	} elsif (/^\s+(\S.*)/) {
		die 'No person yet!' unless defined $person;
		push @{ $provisions{$person} }, $1;
	} else {
		die "I don't understand: $_";
	}
}
print $provisions{'Gilligan'}->[2], "\n";
close IN_FH;
   # The actual data structure is listed following:
      # my %provisions = (
	     # The Skipper => [ blue_shirt, hat, jacket,preserver, sunscreen ],
		 # Professor   => [ sunscreen, water_bottle, slide_rule ],
		 # Gilligan    => [ red_shirt, hat, lucky_socks,water_bottle ], 	  
	 # );