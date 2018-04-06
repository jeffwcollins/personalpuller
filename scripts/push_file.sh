#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
cd $BASEDIR
#delete site .onion after visiting it 
while read p; do 
        scrapy crawl tor -a passed_url=$p -a test=yes
        sed -i '1d' $1
done < $1
