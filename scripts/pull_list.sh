#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
LIST=`mktemp`
LIST2=`mktemp`
TOR2WEB_JSON=`mktemp`
http_proxy="" https_proxy="" wget --no-check-certificate -O $TOR2WEB_JSON https://eqt5g4fuenphqinx.tor2web.org/antanistaticmap/stats/yesterday
$SCRIPTDIR/import_tor2web.py $TOR2WEB_JSON > $LIST
rm $TOR2WEB_JSON

curl --proxy 127.0.0.1:3129 -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.112 Safari/534.30" http://zlal32teyptf4tvi.onion/json/all >> $LIST
$SCRIPTDIR/purify.sh $LIST > $LIST2
NUMBER=`wc -l $LIST2 | tr -s ' ' | cut -f 1 -d ' '`
echo "Harvested $NUMBER onion links..."
$SCRIPTDIR/push_list.sh $LIST2
rm $LIST $LIST2
