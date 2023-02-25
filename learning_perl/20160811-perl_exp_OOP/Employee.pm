package Employee;
use warnings;
use strict;

use Carp;

sub new {
	my $class = shift;
	my (%params) = @_;
	my $objptr = {
		Name => $params{Name} || croak "No name assigned.\n",
		Extension => $params{Extension},
		Address => $params{Address},
		PayCheck => $params{PayCheck} || croak "No pay assigned.\n",
		defined $params{IdNum} ? 
			( IdNum => $params{IdNum} ):( IdNum => "Employee's id was not provided!" ),
	}
	return bless $objptr, $class;
}

sub get_stats {
	my $self = shift;
	while ( my ($keys, $values) = each %$self ) {
		print $keys, " = ", $values, "\n";
	}
	print "\n";
}

1;
__END__