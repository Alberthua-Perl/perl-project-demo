#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;

# The script is used to evaluate the indexes included in multiple libraries, in order to
# prevent the same pair of indexes on the same run on illumina platform. 
# Also it can be used to detect whether the operator used the correct index, for example,
# the index for OncoAim/BRCAim can't be used in ddCAP/cHOP, etc.
# File: index_debug.txt
# Created on 2017.2.19 19:15 by HLF. 

my %index_unit = (
	
	# index for ddCAP or cHOP
	ddCAP => {	  			  
		'D760' => 'TTCAGCTC', 'D704' => 'GAGATTCC', 'D755' => 'TCATTGAG', 'D717' => 'ACAGTGGT',
        'D711' => 'TCTCGCGC', 'D759' => 'TACTAGTC', 'D707' => 'CTGAAGCT', 'D726' => 'TCTCGGTT',
		'D750' => 'TCTCACGG', 'D721' => 'GATCAGCG', 'D709' => 'CGGCTATG', 'D701' => 'ATTACTCG',
		'D749' => 'GGCACAAC', 'D754' => 'TGTATGCG', 'D756' => 'TGGCTCAG', 'D710' => 'TCCGCGAA',
        'D740' => 'TACAGGAT', 'D703' => 'CGCTCATT', 'D716' => 'TGACCACT', 'D757' => 'TATGCCAG',
        'D746' => 'TAACGCTG', 'D731' => 'TCTGCTGT', 'D738' => 'TTCCTGCT', 'D706' => 'GAATTCGT',
        'D723' => 'GGCTACAG', 'D705' => 'ATTCAGAA', 'D728' => 'TCCGTCTT', 'D734' => 'TGATACGT',
		'D714' => 'CGATGTTT', 'D729' => 'TGTACCTT', 'D751' => 'TCAGGAGG', 'D743' => 'TAGTCTTG',
		'D753' => 'TCCAGTCG', 'D724' => 'CTTGTACT', 'D708' => 'TAATGCGC', 'D718' => 'GCCAATGT',
        'D732' => 'TTGGAGGT', 'D736' => 'GGTTGGAC', 'D719' => 'CAGATCTG', 'D752' => 'TAAGTTCG',
		'D747' => 'TTGGTATG', 'D725' => 'TGGTTGTT', 'D741' => 'TCCTCAAT', 'D712' => 'AGCGATAG',
		'D733' => 'TCGAGCGT', 'D720' => 'ACTTGATG', 'D737' => 'TGCGATCT', 'D745' => 'TCGAAGTG',
        'D727' => 'TAAGCGTT', 'D730' => 'TTCTGTGT', 'D713' => 'ATCACGTT', 'D722' => 'TAGCTTGT',
		'D758' => 'TCAGATTC', 'D702' => 'TCCGGAGA', 'D748' => 'TGAACTGG', 'D739' => 'TAGTGACT',
        'D735' => 'GTGCTACC', 'D744' => 'TTCCATTG', 'D715' => 'TTAGGCAT', 'D742' => 'TGTGGTTG',
		'UMI-12N' => 'NNNNNNNNNNNN'	
	},
	
	# index for OncoAim or BRCAim				
	OncoAim => {			  			
		 'D704' => 'GGAATCTC', 'D711' => 'GCGCGAGA', 'D705' => 'TTCTGAAT', 'D702' => 'TCTCCGGA',
         'D703' => 'AATGAGCG', 'D712' => 'CTATCGCT', 'D709' => 'CATAGCCG', 'D707' => 'AGCTTCAG',
         'D708' => 'GCGCATTA', 'D710' => 'TTCGCGGA', 'D706' => 'ACGAATTC', 'D701' => 'CGAGTAAT',		
		 'D505' => 'AGGCGAAG', 'D503' => 'CCTATCCT', 'D507' => 'CAGGACGT', 'D506' => 'TAATCTTA',
         'D508' => 'GTACTGAC', 'D504' => 'GGCTCTGA', 'D501' => 'TATAGCCT', 'D502' => 'ATAGAGGC'
	},
);

open OUT, '>', 'debug.hash.txt' or die "Can't output the file: $!";
my ($count, $i7_i5, %debug);
while (<>) {
	chomp;
	my @index_info = split;							
		# input file format: library, i7 ID, i7 index, i5 ID, i5 index
	
	if ( $index_info[0] =~ /OncoAim|BRCA.*?/i ) {
		$index_info[0] = 'OncoAim';

		if ( $index_unit{ $index_info[0] }{ $index_info[-4] } eq $index_info[-3]
				and $index_unit{ $index_info[0] }{ $index_info[-2] } eq $index_info[-1] ) {
					# i7 index and i5 index must be together in OncoAim or BRCAim.
			$i7_i5 = $index_info[-4]." ".$index_info[-2];
			$debug{$i7_i5}++;				
		} else {
			my $error = $index_info[-4] || $index_info[-2];
			print "\nThe pair of index  $error for OncoAim or BRCAim is error!\n";
		}

	} elsif ( $index_info[0] =~ /ddCAP|cHOP/i ) {
		$index_info[0] = 'ddCAP';

		if ( $index_unit{ $index_info[0] }{ $index_info[-4] } eq $index_info[-3]
				and $index_unit{ $index_info[0] }{ $index_info[-2] } eq $index_info[-1] ) {
			$i7_i5 = $index_info[-4]." ".$index_info[-2];
			$debug{$i7_i5}++;
		} else {
			my $error = $index_info[-4] || $index_info[-2];
			print "\nThe pair of index  $error for ddCAP or cHOP is error!\n";
		}

	}
	$count++;
}
print "\n$count libs on this run!\n";						
	# calculate the number of libs 
print OUT Data::Dumper->Dump( [ \%debug ], [ qw(*debug) ] );

my @rep = grep { $debug{$_} == 2 } keys %debug;		# find the same index

unless (@rep) {
	print "All indexes are correct!\nNo repeat!\nPass!\n";
} else {
	my $rep = join "\n", @rep;
	print "$rep repeated!\nAttention!!!\n";
}

