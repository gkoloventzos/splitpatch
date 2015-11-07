#!/usr/bin/perl
use strict;
use warnings;

use File::Basename;
use Getopt::Long;

my $help = 0;
my $file = "";

if ( @ARGV > 0 ) {
	    GetOptions('verbose'	=> \$verbose,
		       'trace'	=> \$trace,
		       'help|?'	=> \$help,
		       'manual'	=> \$man,
		       'debug'	=> \$debug);
}
