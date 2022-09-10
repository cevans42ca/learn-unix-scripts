#!/usr/bin/env perl

use Term::ANSIColor;

#Color       #define       Value       RGB
#black     COLOR_BLACK       0     0, 0, 0
#red       COLOR_RED         1     max,0,0
#green     COLOR_GREEN       2     0,max,0
#yellow    COLOR_YELLOW      3     max,max,0
#blue      COLOR_BLUE        4     0,0,max
#magenta   COLOR_MAGENTA     5     max,0,max
#cyan      COLOR_CYAN        6     0,max,max
#white     COLOR_WHITE       7     max,max,max

sub convert_color {
	# Switch is not provided by default on Mac OS X.
	$convert = $_[0];
	if ($convert == 0) { return "black"; }
	elsif ($convert == 1) { return "red"; }
	elsif ($convert == 2) { return "green"; }
	elsif ($convert == 3) { return "yellow"; }
	elsif ($convert == 4) { return "blue"; }
	elsif ($convert == 5) { return "magenta"; }
	elsif ($convert == 6) { return "cyan"; }
	elsif ($convert == 7) { return "white"; }
	else {
		print STDERR "Color number $convert not supported.";
		exit 1;
	}
}

if ($ARGV[0] eq "sgr0") {
	print color('reset');
}
elsif ($ARGV[0] eq "setb") {
	print color("on_" . convert_color($ARGV[1]));
}
elsif ($ARGV[0] eq "setab") {
	print color("on_" . convert_color($ARGV[1]));
}
elsif ($ARGV[0] eq "setaf") {
	print color(convert_color($ARGV[1]));
}
elsif ($ARGV[0] eq "setf") {
	print color(convert_color($ARGV[1]));
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
