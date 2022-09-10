#!/usr/bin/env perl

use Term::ANSIColor;

if ($ARGV[0] eq "sgr0") {
	print color('reset');
}
else {
	print color(join ' ', @ARGV);
}
