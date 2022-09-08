#!/usr/bin/env perl

use Term::ANSIColor;

$path=$ARGV[0]; $script_path=$ARGV[1];

if ("$path" =~ /(^|.*:)(\Q${script_path}\E)(:.*|$)/)
{ print $1 . color('bold red') . $2 . color('reset') . $3 . "\n"; }
else
{ print "Unable to find ${script_path} in $path.\n"; }
