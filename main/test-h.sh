#!/usr/local/bin/bash

perl -e "$(cat <<'EOF'
use Term::ANSIColor;
$script_path=$ARGV[0];

if ($ENV{"PATH"} =~ /(^|.*:)(\Q${script_path}\E)(:.*|$)/)
{ print $1 . color('bold red') . $2 . color('reset') . $3 . "\n"; }
else
{ print "Unable to find ${script_path} in " . $ENV["PATH"] . ".\n"; }
EOF
)" /Users/cevans/bin
