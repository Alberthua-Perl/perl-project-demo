use strict;
use warnings;
use Data::Dumper;

my $sales = {
    monday => {
        jim  => [ 3, 4 ],
        mary => [4],
    },
    tuesday => {
        jim  => [ 3, 5, 1 ],
        mary => [ 1, 1, 1, 1, 9 ],
    },
};

my $commissions = $sales->{tuesday}{jim};
my $num_sales   = @$commissions;
my $total       = 0;
foreach (@$commissions) {
    $total += $_;
}
print "Jim made $num_sales sales on Tuesday and earned \$$total commission\n";
1；