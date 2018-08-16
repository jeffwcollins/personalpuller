#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
LIST=`mktemp`
LIST2=`mktemp`
#
for i in $(seq 1 10); do
$SCRIPTDIR/tor_extract_from_url.sh "http://jld3zkuo4b5mbios.onion/?page=$i" >> $LIST
$SCRIPTDIR/purify.sh $LIST >> $LIST2
NUMBER=`wc -l $LIST2 | tr -s ' ' | cut -f 1 -d ' '`
echo "Harvested $NUMBER onion links..."
$SCRIPTDIR/push_list.sh $LIST2
rm $LIST $LIST2
done
#
