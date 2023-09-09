#!/usr/bin/perl

use 5.010;
use warnings;
use strict;

# hash slice
my %score;
my @players = qw/ barney fred dino /;
my @bowling_scores = (195, 205, 30);
@score{ @players } = @bowling_scores;
	# while ( my($key, $value) = each %score ){
		# print "$key => $value\n";
	# }

# eval block
my $fred = 18;
my $dino = 0;
my $barney = eval { $fred/$dino } // 'Not a number';
print $barney, "\n";
unless ( eval { $fred/$dino } ) {
	print "I couldn't divide by \$dino: $@";	# if $@;
}

my @averages = ( 2/3, eval { $fred/$dino }, 22/7 );
print "@averages\n";

foreach my $person (qw/fred.txt wilma.txt betty.txt barney.txt dino.txt pebbles.txt/) {
	eval {
		open my $fh, '<', $person
			or die "Can't open file '$person': $!";
		my($total, $count);
		while (<$fh>) {
			chomp;
			$total += $_;
			$count++;		
		}
		my $average = $total/$count;
		print "Average for file $person was $average\n";		
	};	
	if ($@) {
		print "An error occurred ($@), continuing\n";
	}
}

# grep function
my @odd_numbers = grep { $_ % 2 } 1..1000;
print "@odd_numbers\n";

open my $fh,'<','freddoc.txt' 
	or die "Don't open the file:$!\n";
my @matching_lines = grep { /\bfred\b/i } <$fh>;
print "@matching_lines\n";