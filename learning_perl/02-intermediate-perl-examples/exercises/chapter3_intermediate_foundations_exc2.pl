#!/usr/bin/perl

use warnings;
use strict;
use File::Basename qw(basename);
use File::Spec;

# Intermediate Perl p34 exercise 2

sub find_file {
		# The subroutine can be used to find the file in directory.
	my ($pattern, $starting_dir) = @_;
	my @file_dir;
	
	eval {
		@file_dir = ( $starting_dir );		
		while (@file_dir) {
			my $item = shift @file_dir;
			if ( -d $item ) {
				opendir DIR, $item 
					or die "Can't open the directory $item: $!";
				my @fil_list = grep { /^[^(\.|\.\.)]+/ } readdir DIR;
				for (@fil_list) {
					push @file_dir, File::Spec->catfile( $item, $_ );
				}				
			} else {
				if ( $item =~ /$pattern$/m ) {
					print $item, "\n";
				}
			}			
		}		
	};	
	
	print "An ERROR: $@" if ($@);	
	print "\n";
}

print "1.Please enter your target directory: ";
chomp( my $dir = <STDIN> );
print "2.Warning: Don't type the slashes around the pattern, \n", 
	"  and you can enter an empty string to exit it!\n";
print "3.Please enter a pattern to $dir : \n";

while ( my $input = <STDIN> ) {
	chomp $input;
	find_file( $input, $dir );
	if ( $input =~ /\s+/ ) {
		exit;
	}
}
