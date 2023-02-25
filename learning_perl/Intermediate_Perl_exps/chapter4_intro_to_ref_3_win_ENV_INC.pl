#!/usr/bin/perl

use warnings;
use strict;
use Carp qw(croak);
# use Scalar::Util qw(reftype);

# This script is used to tell user %ENV and %INC in winOS.
# %INC hash contains the path that the module of the running Perl programme points to.

sub is_hash_ref {
	my $hash_ref = shift;	# The subroutine can be used to check reference type.
	return eval { keys %$hash_ref; 1 };
}

sub env_var {
	my $built_in_var = shift;
	
	my $hash_type = ref $built_in_var;	# reftype: works with objects
	croak "This should be hash!\n" unless $hash_type eq ref {};
	# croak "This should be hash!\n" unless is_hash_ref( $built_in_var );
		
	while ( my ($key, $value) = each %{$built_in_var} ) {
		print $key, "\t", $value, "\n";
	}
}

print "Perl's \%ENV: \n";
env_var( \%ENV );
print "\nPerl's \%INC: \n";
env_var( \%INC );
print "\nPerl's \@ARGV: \n";
env_var( \@ARGV );