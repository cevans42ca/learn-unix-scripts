#!/usr/local/bin/perl

use Term::ANSIColor;

$script_path=$ARGV[0];

if ($ENV{"PATH"} =~ /(^|.*:)(\Q${script_path}\E)(:.*|$)/)
{
	print $1;
	print color('bold red');
	print $2;
	print color('reset');
	print $3;
	print "\n";
}
else
{
	print "Unable to find ${script_path} in " . $ENV["PATH"] . ".\n";
}
