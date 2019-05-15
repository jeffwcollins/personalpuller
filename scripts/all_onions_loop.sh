#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
LIST=`mktemp`
LIST2=`mktemp`
#
for i in $(seq 1 1 10000); do
$SCRIPTDIR/tor_extract_from_url.sh "http://jld3zkuo4b5mbios.onion/?page=$i" >> $LIST
$SCRIPTDIR/purify.sh $LIST >> $LIST2
NUMBER=`wc -l $LIST2 | tr -s ' ' | cut -f 1 -d ' '`
echo "Harvested $NUMBER onion links..."
<<<<<<< HEAD
sleep 5s
=======
>>>>>>> 080a008bf86728bd36208ad1ac93c1296448242d
$SCRIPTDIR/push_list.sh $LIST2
rm $LIST $LIST2
done
#
