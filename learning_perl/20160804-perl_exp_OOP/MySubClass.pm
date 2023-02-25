package MySubClass;
use warnings;
use strict;

our @ISA = qw(MyClass);

sub new {
	print "MySubClass::new called!\n";
	my $type = shift;
	my $self = MyClass->new;
	return bless $self, $type;
}

sub DESTROY {
	print "MySubClass::DESTROY called!\n";
}

sub MyMethod {
	my $self_1 = shift;
	$self_1->SUPER::MyMethod();
	print "MySubClass::MyMethod called!\n";
}

1;

__END__