#!/usr/bin/perl

use warnings;
use strict;

# Referencing a Named Subroutine: coderef
sub skipper_greets {
	my $person = shift;
	print "Skipper: Hey there, $person!\n";
}

sub gilligan_greets {
	my $person = shift;
	if ($person eq 'Skipper') {
		print "Gilligan: Sir, yes, sir, $person!\n";
	} else {
		print "Gilligan: Hi, $person!\n";
	}
}

sub professor_greets {
	my $person = shift;
	print "Professor: By my calculations, you must be $person!\n";
}

my %greets = (
  Gilligan  => \&gilligan_greets,
  Skipper   => \&skipper_greets,
  Professor => \&professor_greets,
);

my @everyone = sort keys %greets;
for my $greeter (@everyone) {
	for my $greeted (@everyone) {
		$greets{$greeter}->($greeted) unless $greeter eq $greeted;	
	}
}

print "\n------split line------\n";

my @room;	# initially empty
for my $person (qw(Gilligan Skipper Professor)) {
	print "\n";
	print "$person walks into the room.\n";
	for my $room_person (@room) {
		$greets{$person}->($room_person);
		$greets{$room_person}->($person);
	}
	push @room, $person;
}

print "\n------split line------\n";

# Anonymous Subroutines
my %greets_copy = (

	Skipper => sub {
		my $person = shift;
		print "Skipper: Hey there, $person!\n";
	},

	Gilligan => sub {
		my $person = shift;
		if ($person eq 'Skipper') {
			print "Gilligan: Sir, yes, sir, $person!\n";
		} else {
			print "Gilligan: Hi, $person!\n";
		}
	},

	Professor => sub {
		my $person = shift;
		print "Professor: By my calculations, you must be $person!\n";
	},

	Ginger => sub {
		my $person = shift;
		print "Ginger: (in a sultry voice) Well hello, $person!\n";
	},

);

my @room_copy;	# initially empty
for my $person (qw(Gilligan Skipper Professor Ginger)) {
	print "\n";
	print "$person walks into the room.\n";
	for my $room_person (@room_copy) {
		$greets_copy{$person}->($room_person);	# speaks
		$greets_copy{$room_person}->($person);	# gets reply
	}
	push @room_copy, $person;	# come in, get comfy
}