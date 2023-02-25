#!/usr/bin/perl

# use warnings;
# use strict;
use Data::Dumper;

my $aoh = [ { k11 => 'v11', k12 => 'v12' },
			{ k21 => 'v21', k22 => 'v22' },	];
print $aoh, "\n", Dumper ($aoh), "\n", ref $aoh, "\n";
for ( my $i = 0; $i <= ( scalar @$aoh - 1 ); $i++ ) {
	foreach my $key ( sort keys %{ $aoh->[$i] } ) {
		print $aoh->[$i]{$key}, " ";
	}
}
print "\n";

# Reference counting
{
	my $ra;
	{
		my $a = "Hello world!";
		$ra = \$a;	
	}
	print "ref = $$ra\n", "a = $a\n";
}
print "ref = $$ra";