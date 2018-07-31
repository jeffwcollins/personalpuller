#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
rm $LIST $LIST2 $LIST3 $LIST4 $LIST5
#
LIST=`mktemp`
LIST2=`mktemp`
LIST3=`mktemp`
#
for i in {0..10..1}; echo 'https://web.archive.org/web/20170711212802/https://onions.system33.pw/?page=$i' >> $List; cat $LIST | while read p; do http_proxy="" https_proxy="" wget --no-check-certificate -O - $p >> $List2; done
$SCRIPTDIR/purify.sh $LIST2 > $LIST3
NUMBER=`wc -l $LIST3 | tr -s ' ' | cut -f 1 -d ' '`
echo "Harvested $NUMBER onion links..."
(
cd $BASEDIR
scrapy crawl tor -a load_links=$LIST3 -a test=yes
)
rm $LIST $LIST2 $LIST3

#9444732965739290427392
#
