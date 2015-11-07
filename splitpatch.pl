#!/usr/bin/perl
use strict;
use warnings;

use File::Basename;
use Getopt::Long;

my $help = 0;
my $file = "";
my $verbose = 0;

if ($#ARGV == 0 and ($ARGV[0] =~ m/-h/)) {
	print "Usage: splitpatch.pl patch_file\n";
	print "-file|f <list of files>   list of files you want to create patches\n";
	print "-help|?			 print this message\n";
	exit 0;
}

if ( @ARGV > 0 ) {
	    GetOptions('verbose'	=> \$verbose,
		       'help|?'	=> \$help,
		       "file=s" => \@file,);
}

my @lines = split /\n/, $ARGV[0];

foreach my $line (@lines) {
	
}

exit 0;
