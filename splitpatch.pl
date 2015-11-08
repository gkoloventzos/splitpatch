#!/usr/bin/perl
use strict;
use warnings;

use File::Basename;
use Getopt::Long;

my $help = 0;
my @file = "";
my $split = 0;
my $verbose = 0;

sub print_usage(){
	print "Usage: splitpatch.pl patch_file\n";
	print "-file|f <list of files>   list of files you want to create patches\n";
	print "-split|s 		 split into hunks\n";
	print "-help|?			 print this message\n";
	exit 0;
}

if ($#ARGV == 0) {
	print_usage();
}

if ( @ARGV > 0 ) {
	    GetOptions('verbose'	=> \$verbose,
		       'help|?'	=> \$help,
		       "split"  =>\$split,
		       "file=s" => \@file,);
}

if ($help) {
	print_usage();
}

if ($split) {
  print("Splitting in hunks not yet implemented\n");
  exit 0;
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
  my @first_line = split / /, $line;
  my @path = split /\//, $first_line[2];
  $cur_file = join('_', @path[1..($#path)]);
	$cur_file .= ".patch";
  open(FW,">>",$cur_file);
	print FW $line;
	foreach $line (@lines) {
		unless ($line =! m/^diff/) {
			print FW $line;
		}
	}
	close FW;
}

exit 0;
