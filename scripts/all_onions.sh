#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
rm $LIST $LIST2 $LIST3 $LIST4 $LIST5
LIST=`mktemp`
LIST2=`mktemp`
LIST3=`mktemp`
LIST4=`mktemp`
LIST5=`mktemp`

for i in {0..100..1}; do http_proxy="" https_proxy="" wget --no-check-certificate --tries=1 -O - https://web.archive.org/web/20170711212802/https://onions.system33.pw/?page=$i -O - | grep -E -o '[0-9a-zA_Z]+\.onion' >> $LIST
$SCRIPTDIR/purify.sh $LIST > $LIST2
NUMBER=`wc -l $LIST2 | tr -s ' ' | cut -f 1 -d ' '`
echo "Harvested $NUMBER onion links..."
(
cd $BASEDIR
scrapy crawl tor -a load_links=$LIST2 -a test=yes
)
rm $LIST $LIST2

#9444732965739290427392
