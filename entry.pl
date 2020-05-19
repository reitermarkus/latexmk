#!/usr/bin/env perl

use Cwd;
use Env;
use File::Basename;
use File::Find;
use Text::ParseWords;
use File::Spec;

if ($ENV{GITHUB_ACTIONS} eq 'true') {
  my $path = $ARGV[0] unless $ARGV[0] eq '';
  my @args = shellwords($ARGV[1]);

  my @paths;

  if ($path) {
    @paths = (File::Spec->rel2abs($path));
  } else {
    find({ wanted => \&wanted, follow => 1, follow_skip => 2 }, '.');
    sub wanted {
      if (/^\.?latexmkrc$/) {
        push @paths, getcwd;
      }
    }
  }

  @paths = (getcwd) unless @paths;

  foreach my $path (@paths) {
    chdir($path) or die "Directory '$path' does not exist.\n";
    system('latexmk', @args) == 0 or exit($? >> 8)
  }
} else {
  exec('latexmk', @ARGV)
}

