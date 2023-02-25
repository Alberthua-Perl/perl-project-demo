#!/usr/bin/perl

use warnings;
use strict;

# autoincrement and autodecrement : hash count
my @people = qw( fred barney fred wilma dino barney fred pebbles );
my %count;
$count{$_}++ foreach @people;
while ( my($keys,$values) = each %count ) {
	print "$keys => $values\n";
}

my %seen;
foreach (@people) {
	print "I have seen you somewhere before,$_\n" if $seen{$_}++;
}

# for control structure
for ( my $i = 0;$i <= 10;$i++ ) {
	print "I can count to $i\n";
}
# for (;;) {
	# print "It's an infinite loop!\n";
# }
for ( $_ = "bedrock";s/(.)//; ) {
	print "One character is: $1\n";
	print $_,"\n";
}

my $transname = "hardrock";
while ($transname) {
	$transname =~ s/(.)//;
	print "One character is: $1\n";
	print $transname, "\n";
}

# # next operator
# my $total;
# my $valid;
# my %count1;
# while (<>) {
	# chomp;
	# foreach (split) {
		# $total++;
		# next if /\W/;
		# $valid++;
		# $count1{$_}++;	
	# }
# }
# print " total things = $total,valid words = $valid\n";
# foreach my $word( sort keys %count1 ) {
	# print "$word was seen $count{$word} times.\n";
# }

# # redo operator
# my @words = qw{ fred barney pebbles dino wilma betty };
# my $errors = 0;
# foreach (@words) {
	# print "Type the word '$_': ";
	# chomp(my $try = <STDIN>);
	# if ($try ne $_) {
		# print "Sorry - That's not right.\n\n";
		# $errors++;
		# redo;
	# }
# }
# print "You've completed the test,with $errors errors.\n";

foreach (1..10) {
	print "Iteration number $_.\n\n";
	print "Please choose: last, next, redo, or none of the above? ";
	chomp ( my $choice = <STDIN> );
	print "\n";
	last if $choice =~ /last/i;
	next if $choice =~ /next/i;
	redo if $choice =~ /redo/i;
	print "That wasn't any of the choices... onward!\n\n";
}
print "That's all, folks!\n";