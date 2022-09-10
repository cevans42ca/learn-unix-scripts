#!/usr/bin/env perl

use Term::ANSIColor;

if ($ARGV[0] eq "sgr0") {
	print color('reset');
}
elsif ($ARGV[0] eq "setab") {
	print color("");
}
elsif ($ARGV[0] eq "smul") {
	print color("underline");
}
elsif ($ARGV[0] eq "rmul") {
	print color("reset");
}
else {
	print color(join ' ', @ARGV);
}
