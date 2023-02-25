package Employee;
use warnings;
use strict;

use Person;
our @ISA = qw(Person);	# inheritance class: Person

# Override constructor function
sub new {	
	my ($class) = @_;
	my $self = $class->SUPER::new( $_[1], $_[2], $_[3] );
		# call the superclass constructor
	
	# $self{_id} = undef;
	# $self{_title} = undef;
	bless $self, $class;
	return $self;
}

# Override method
sub getFirstName {
	my ($self_1) = @_;
	print "This is subclass subroutine!\n";
	return $self_1->{_firstName};
}

## Add method
sub setLastName {
	my ($self_2, $lastName) = @_;
	$self_2->{_lastNam} = $lastName if (defined $lastName);
	return $self_2->{_lastName};
}

sub getLastName {
	my ($self_3) = @_;
	return $self_3->{_lastName};
}

1;

__END__