
#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
rm $LIST $LIST2 $LIST3 $LIST4 $LIST5
LIST=`mktemp`
LIST2=`mktemp`
LIST3=`mktemp`
LIST4=`mktemp`
LIST5=`mktemp`

for i in {0..1000..1}; do http_proxy="" https_proxy="" wget --no-check-certificate -O - https://micropaste.com/lists/$i -O - | grep -o -P "micropaste.com/view/.{0,8}"; done | awk -F'/' '{print $3}' >> $LIST
cat $LIST | while read p; do echo https://micropaste.com/view/raw/$p >> $LIST2; done
#cat $LIST2 > $BASEDIR/"MICROPASTESITES$(date +"%FT%H%M%").txt"
#$SCRIPTDIR/push_list
cat $LIST2 | while read p; do http_proxy="" https_proxy="" wget --no-check-certificate -O - $p >> $LIST3; done
$SCRIPTDIR/purify.sh $LIST3 > $LIST4
NUMBER=`wc -l $LIST4 | tr -s ' ' | cut -f 1 -d ' '`
echo "Harvested $NUMBER onion links..."
#cat $LIST3 >> list3
#cat $LIST4 >> list4
$SCRIPTDIR/push_list.sh $LIST4
#

rm $LIST $LIST2 $LIST3 $LIST4 $LIST5

#if [ $FOUND -gt 0 ]; then
#	(
#	cd $BASEDIR
#	scrapy crawl tor -a load_links=$PURIFIED -a test=yes
#)
#fi;
