#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
#LIST4=`mktemp`
#LIST5=`mktemp`
#LIST6=`mktemp`
#

$SCRIPTDIR/purify.sh domainlist2 > domainlist3
NUMBER=`wc -l domainlist3 | tr -s ' ' | cut -f 1 -d ' '`
echo "Harvested $NUMBER onion links..."
(
cd $BASEDIR
scrapy crawl tor -a load_links=domainlist3 -a test=yes
)
rm $LIST4 $LIST5 $LIST6
#
#9444732965739290427392
#
