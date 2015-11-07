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
my $first = 1;
my $infile = 0;
my $cur_file = "";

foreach my $line (@lines) {
	if ($first) {
		$first =0;
		unless ($line =~ m/^diff/) {
			print "No patch file\n";
			exit 1;
		}
	}
	/*find file name*/
	$cur_file .= ".patch";
	open(FW,">>./"$cur_file);
	print FW $line;
	while $line (@lines) {
		unless ($line =! m/^diff/) {
			print FW $line;	
		}
	}
	close FW;
}

exit 0;
