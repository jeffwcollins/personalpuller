#!/bin/sh
DIR=$( cd "$(dirname "$0")" ; pwd -P )
. $DIR/env.sh
LIST=`mktemp`
LIST2=`mktemp`
TOR2WEB_JSON=`mktemp`
http_proxy="" https_proxy="" wget --no-check-certificate -O $TOR2WEB_JSON https://eqt5g4fuenphqinx.tor2web.org/antanistaticmap/stats/yesterday
$SCRIPTDIR/import_tor2web.py $TOR2WEB_JSON > $LIST
rm $TOR2WEB_JSON

$SCRIPTDIR/tor_extract_from_url.sh 'http://underdjcuqyolmph.onion/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://danwin1210.me/onions.php?format=text' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.nextleveltricks.com/deep-web-darknet-websites-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'http://www.thehackerstore.net/2015/07/huge-list-of-darknet-deep-web-hidden.html' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://thehiddenwiki.org/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://torhiddenwiki.com/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://darknetmarkets.org/markets/' >> $LIST
$SCRIPTDIR/tor_extract_from_url.sh 'http://torlinkbgs6aabns.onion/#financial' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.reddit.com/r/onions/comments/73jpvo/loads_of_good_onion_links_part_two/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'http://deepweblinks.org/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/top-50-dark-web-onion-domains-pagerank/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/1/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/2/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/3/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/4/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/5/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/6/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/7/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/8/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/9/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/10/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/11/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/12/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/13/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/14/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/15/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/16/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/17/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links-2015/18/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links/1/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links/2/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links/3/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links/4/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links/5/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links/6/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepweb-sites.com/deep-web-links/7/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.quora.com/What-are-some-cool-dark-web-websites?share=1' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.reddit.com/r/onions/comments/56sz15/suggestions_links_post_it_here/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'http://www.linuxx.eu/p/deep-web-link-list-onion.html' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/tor-emails-chat-rooms-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-forums-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-drugs-sites-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-hitman-escrow-rent-hacker-documents-deep-web-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-bitcoin-counterfeit-credit-cards-paypal-accounts-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-torrent-movie-games-sites-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-weapons-software-hacking-virus-cracking-sites-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/page/13/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/gadgets-deep-web-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/page/15/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/red-room-deep-web-social-media-extra-deep-web-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-screenshot/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/tor-search-engine-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-books-sites-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-hosting-file-hosting-image-hosting-service-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-markets-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.reddit.com/r/onions/comments/2epckb/new_huge_onion_link_list/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://onion.cab/list.php?a=list' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.reddit.com/r/onions/search?q=url%3A.onion&sort=new' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://ahmia.fi/address/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://ahmia.fi/onions/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepdotweb.com/2013/10/28/updated-llist-of-hidden-marketplaces-tor-i2p/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://darkwebnews.com/deep-web-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://raw.githubusercontent.com/alecmuffett/onion-sites-that-dont-suck/master/README.md' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://en.wikipedia.org/wiki/List_of_Tor_hidden_services' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.reddit.com/r/darknetmarkets/wiki/superist.json' >> $LIST 
$SCRIPTDIR/tor_extract_from_url.sh 'http://tt3j2x4k5ycaa5zt.onion/onions.php?format=text' >> $LIST
$SCRIPTDIR/tor_extract_from_url.sh 'http://skunksworkedp2cg.onion/sites.html' >> $LIST
$SCRIPTDIR/tor_extract_from_url.sh 'http://visitorfi5kl7q7i.onion/onions/' >> $LIST
$SCRIPTDIR/tor_extract_from_url.sh 'http://underdj5ziov3ic7.onion/crawler/index.php?online=1' >> $LIST
$SCRIPTDIR/tor_extract_from_url.sh 'http://7cbqhjnlkivmigxf.onion/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.reddit.com/r/HiddenService/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/2/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/3/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/4/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/5/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/6/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/7/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/8/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/9/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/10/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/11/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/12/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/13/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/14/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/15/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/16/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/17/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/18/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/19/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.thedarkweblinks.com/page/20/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.deepwebsiteslinks.com/deep-web-links/' >> $LIST
$SCRIPTDIR/extract_from_url.sh 'https://www.onion.link/sitemap.xml/' >> $LIST
$SCRIPTDIR/purify.sh $LIST > $LIST2
NUMBER=`wc -l $LIST2 | tr -s ' ' | cut -f 1 -d ' '`
echo "Harvested $NUMBER onion links..."
$SCRIPTDIR/push_list.sh $LIST2
rm $LIST $LIST2
