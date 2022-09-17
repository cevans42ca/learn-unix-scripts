#!/bin/sh

# Mimic fmt -s on Linux.

# Break long lines but don't rejoin:  good for lists, but only breaks lines once.

GOAL=`expr $1 - 10`
MAX=10
sed 's/\(.\{'$GOAL'\}[^\ ]\{0,'$MAX'\}\ \)\(.*\)$/\1\
\2/'
