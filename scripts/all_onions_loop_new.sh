#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
LIST=`mktemp`
LIST2=`mktemp`
#
for i in $(seq 1 1 1000000); do
$SCRIPTDIR/tor_extract_from_url.sh "http://jld3zkuo4b5mbios.onion/?page=$i" >> /root/torscraper/torlist.txt
done
#
