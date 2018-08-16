#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
#LIST4=`mktemp`
#LIST5=`mktemp`
#LIST6=`mktemp`
#
for i in $(seq 1 1000000); do
  echo "http://jld3zkuo4b5mbios.onion/?page=$i" >> domainlist;
done
#
