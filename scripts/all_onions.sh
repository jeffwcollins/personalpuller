#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
LIST=`mktemp`
LIST2=`mktemp`
#LIST6=`mktemp`
#
for i in $(seq 101 808); do
  $SCRIPTDIR/tor_extract_from_url.sh "http://underdj5ziov3ic7.onion/crawler/index.php?pg=$i" >> $LIST
done
$SCRIPTDIR/purify.sh $LIST >> $LIST2
NUMBER=`wc -l $LIST2 | tr -s ' ' | cut -f 1 -d ' '`
echo "Harvested $NUMBER onion links..."
sleep 1m
$SCRIPTDIR/push_list.sh $LIST2
rm $LIST $LIST2
#
