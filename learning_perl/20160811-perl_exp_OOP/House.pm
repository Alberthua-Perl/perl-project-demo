package House;
use warnings;
use strict;

sub new {
	my $class = shift;
	my ($owner, $price, $style) = @_;
	my $ref = {
		Owner => $owner,
		Price => $price,
		Style => $style,
	};	# hardcoded keys
	return bless $ref, $class;
}

sub set_owner {
	my $self = shift;
	print "\$self is a class", ref $self, "reference.\n";
	$self->{Owner} = shift;
}

sub display_owner {
	my $self = shift;
	print $self->{Owner}, "\n";
}

sub display_object {
	my $self = shift;
	while ( my ($keys, $values) = each %$self ) {
		print "$keys : $values \n";
	}
}

sub display {
	my $self = shift;
	foreach my $key (@_) {
		print $key, ":", $self->{$key}, "\n";
	}
}

1;
__END__