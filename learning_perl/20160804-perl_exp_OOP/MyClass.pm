package MyClass;
use warnings;
use strict;

sub new {
	my $type = shift;
	my $self = {};
	return bless $self, $type;
}

sub DESTROY {
	print "MyClass::DESTROY called!\n";
}

sub MyMethod {
	print "MyClass::MyMethod called!\n";
}

1;

__END__