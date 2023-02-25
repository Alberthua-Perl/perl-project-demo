package Person;
use warnings;
use strict;

# Example: OOP in Perl

sub new {	# constructor function
	my $class = shift;
	my $self = {
		_firstName => shift,
		_lastName  => shift,
		_ssn       => shift,
	};
	print "Name: ", $self->{_firstName}, "\n";
	print "Family name: ", $self->{_lastName}, "\n";
	print "Number: ", $self->{_ssn}, "\n";
	bless $self, $class;
	return $self;
}

sub setFirstName {
	my ($self_1, $firstName_1) = @_;
	$self_1->{_firstName} = $firstName_1 if (defined $firstName_1);
	return $self_1->{_firstName};
}

sub getFirstName {
	my ($self_2) = @_;
	return $self_2->{_firstName};
}

1;

__END__