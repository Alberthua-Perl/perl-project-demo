#!/usr/bin/perl
# 
#  copyright by hualongfeiyyy@163.com
#  convert hexadecimal ip address and port in /proc/net/tcp
#  e.g. 017AA8C0:0035 under local_address
#
#  usage example: perl ./convert_addr_port.pl 017AA8C0 0035

use warnings;
use strict;

my $hexip = $ARGV[0];
my $hexport = $ARGV[1];

print "hex: $hexip\n";

my @ip = map hex($_), ($hexip =~ m/../g);
print "convert: @ip\n";

my $ip = join('.', reverse(@ip));
my $port = hex($hexport);
print "IP: $ip  PORT: $port\n";
