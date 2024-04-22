#!/usr/bin/perl

use 5.008;
use strict;
use warnings;
use List::MoreUtils qw(uniq);

my @array_a=(1 .. 3);
my @array_b=(1 .. 20);
# my @sorted=(10,15,30,35,40,50);
# print binary_search(100,\@sorted),"\n";

my $aa=is_child_array(\@array_a,\@array_b);
print $aa,"\n";

sub is_child_array{
	my ($child_ref,$parent_ref)=@_;
	# my @parent_array=get_uniq($parent_ref);
	my $num=uniq (@{$child_ref}, @{$parent_ref});
	# print $num," total\n";
	# print scalar uniq (@{$parent_ref})," parent\n";
	$num == uniq (@{$parent_ref}) ? 'yes':'no';
}

sub binary_search{
	my ($target,$sorted)=@_;
	my ($low,$high)=(0,$#{$sorted});
	my ($try);
	
	return $$sorted[$high] if $target >$$sorted[$high];
	while($low < $high-1){
		$try=int(($low+$high)/2);
		if($$sorted[$try]>$target){
		$high=$try;
		# print "$target,$low,$$sorted[$low],$high,$$sorted[$high]],$try,$$sorted[$try]]\n";				
		}elsif($$sorted[$try]<$target){
			$low=$try;
			# print "$target,$low,$$sorted[$low],$high,$$sorted[$high],$try,$$sorted[$try]]\n";			
		}else{
			return $$sorted[$try];			
			}	
	}
	return $$sorted[$low];
}
