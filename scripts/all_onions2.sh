#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh

cat domainlist | while read p; do
  $SCRIPTDIR/tor_extract_from_url.sh $p >> domainlist2;
done
#
#9444732965739290427392
#
