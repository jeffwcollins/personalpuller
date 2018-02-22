# Fresh Onions TOR Hidden Service Crawler

This is a copy of the source for the http://zlal32teyptf4tvi.onion hidden service, which implements a tor hidden service crawler / spider and web site.

## Features

* Crawls the darknet looking for new hidden service
* Find hidden services from a number of clearnet sources
* Optional fulltext elasticsearch support
* Marks clone sites of the /r/darknet superlist
* Finds SSH fingerprints across hidden services
* Finds email addresses across hidden  services
* Finds bitcoin addresses across hidden services
* Shows incoming / outgoing links to onion domains
* Up-to-date alive / dead hidden service status
* Portscanner
* Search for "interesting" URL paths, useful 404 detection
* Automatic language detection
* Fuzzy clone detection (requires elasticsearch, more advanced than superlist clone detection)
* Doesn't fuck around in general.

## Licence

This software is made available under the GNU Affero GPL 3 License.. What this means is that is you deploy this software as part of networked software that is available to the public, you must make the source code available (and any modifications).

From the GNU site:

> The GNU Affero General Public License is a modified version of the ordinary GNU GPL version 3. It has one added requirement: if you run a modified program on a server and let other users communicate with it there, your server must also allow them to download the source code corresponding to the modified version running there

## Dependencies

* python
* tor

## Warning
The version of elasticsearch need to be less than 6.x. I think the maximum is 5.6.6 in 5.x version. If you go higher of 5.x you will have problems. Also, if you decide to install kibana or any extra functionality link to elasticsearch, install it with the same version, because it's really capricious.  

Do not start too many instances of scraper/crawler, because with only 4 instances of tor proxy, it will be hard to connect to the onion site and the crawler will think that the site is down so you will have wrong data in your DB/Elasticsearch. Also, if you start too many instances or tor proxy you can be blocked.

The pastebin script works only if you are on the white list of pastebin. If you're not, you will need to read the scraping API to understand how to activate it : https://pastebin.com/api_scraping_faq

After a boot, be sure that the link between Tor and Privoxy is working.

    curl --socks5-hostname 127.0.0.1:9050 http://http://workingOnionWebsite
    curl --proxy 127.0.0.1:3129 http://workingOnionWebsite
    
If they don't work just fix the problem before crawling, because all your onion will become to a "dead" status 

### Tor browser Linux (Complementary)
To test website before crawling (install this to have an interface and to have a better visualisation) Important!! Tor browser need and interface... don't install this on a console

* download https://www.torproject.org/download/download-easy.html.en
* extract the folder to your desktop.
* edit tor-browser_en-US/start-tor-browser to be able to open it.


Change this
  
    if [ "`id -u`" -eq 0 ]; then
        complain "The Tor Browser Bundle should not be run as root.  Exiting."
        exit 1
    fi  
    

To :

    if [ "`id -u`" -eq 1 ]; then
      complain "The Tor Browser Bundle should not be run as root.  Exiting."
      exit 1
    fi

* click on Tor Browser file and click on connect.

### Tor service

    sudo apt-get install tor

### Haproxy service

    sudo apt-get install haproxy
    
### Privoxy service

    sudo apt-get install privoxy

### Install Pip:

    sudo apt-get install python-pip
    sudo pip install --upgrade pip
### Install Virtual environment    
    sudo pip install virtualenv
    sudo apt-get install python-virtualenv

Go in your crawler/scraper folder and write.

    virtualenv venv

then activate it.

    . venv/bin/activate
    # Run the next command when you're in your virtual envir, because if you aren't in it will install in your normal envir
    pip install -r requirements.txt
### Install MariaDB
*** Mysql have a problem with some synthax in the code so I recommand you to install Mariadb ***

    sudo apt-get install mariadb-server
    sudo apt-get install mariadb-client

Now we will connect to mariadb and create our database from schema.sql . We need to be in the folder to be able to see schema.sql, because we will need it later.

    mysql -u root
    CREATE DATABASE databaseName;
    use databaseName;
    source schema.sql
To know if all works well you should have "Query OK" on each rows. You should have 20 tables if you do this command:

    show tables;

Need a modification to be able to connect elasticsearh with our database.

    use mysql;
    update user set plugin='mysql_native_password' where User='root';
    flush privileges;
    exit
    #To secure the installation. By default the password should be empty so just press enter. I recommand to put one.
    sudo mysql_secure_installation
    #To reconnect
    mysql -u root -p

### Config your files
Edit `etc/database` for your database setup

Edit `etc/tor/torrc` to uncomment the line : SocksPort 9050 (line 18)

Edit `etc/uwsgi_only` and set BASEDIR to wherever torscraper is installed (i.e. /home/user/torscraper)

Edit `etc/proxy` for your TOR setup

    export TOR_PROXY_PORT=3129
    #export TOR_PROXY_PORT=3140
    export TOR_PROXY_HOST=localhost
    export http_proxy=http://localhost:3129
    #export http_proxy=http://localhost:3140
    export https_proxy=https://localhost:3129
    export SOCKS_PROXY=localhost:9050
    HIDDEN_SERVICE_PROXY_HOST=127.0.0.1
    HIDDEN_SERVICE_PROXY_PORT=9090

 Now we will go in privoxy config

    cd /etc/privoxy/
    cp default.action default.action.orig
    cp default.filter default.filter.orig
    touch default.action (let file empty)
    touch default.filter (let file empty)

### Start your services

    service tor start
    service privoxy start
    service haproxy start

Go in the scripts folder and run this command

    ./create_privoxy_confs.sh
   
Now it's time to try. Go in folder for the first time .../freshonions-torscraper/scripts/

    ./start.sh
    
If you get something likes to privoxy localhost port forwarding don't continue, it will not work.

    . push.sh someoniondirectory.onion

If you have errors, that are link to a missing module, do one of theses commands write the one that is link to your error(s).

    pip install scrapy
    pip install flask
    pip install app
    pip install timeout_decorator
    pip install python-dateutil
    pip install pretty
    pip install pymysql
    pip installcrypto
    pip install SHA256
    pip install pycountry
    pip install langdetect
    pip install python-memcached
    pip install pycrypto
    pip install twisted
    pip install txsocksx
    pip install tabulate
    pip install gensim
    pip install sklearn
    pip install networkx
    pip install paramiko
    pip install 'PyPyDispatcher>=2.1.0'

To start the flask server to see our web interface.

    ./scripts/web.sh

Set up the port forwarding from server to browser do this command on your computer to access server

    ssh -L 5000:localhost:5000 username@IpAddressOfServer

To try if it works well for now.

    scripts/push.sh someoniondirectory.onion
    scripts/push.sh anotheroniondirectory.onion
    
Run:

    script/harvest.sh # to get onions (just detect the onions, dont go deep to find bitcoin address, emails, etc.)
    init/scraper_service.sh # to start crawling (will get bitcoin address, emails, etc. if you already found onions with harvest.sh)
    init/isup_service.sh # to keep site status up to date
    
### Optional ElasticSearch Fulltext Search

The torscraper comes with optional elasticsearch capability (enabled by default). Edit `etc/elasticsearch` and set vars or set `ELASTICSEARCH_ENABLED=false` to disable. 

Run `scripts/elasticsearch_migrate.sh` to perform the initial setup after configuration.

If elasticsearch is disabled there will be no fulltext search, however crawling and discovering new sites will still work.


### ElasticSearch
To enable Elasticsearch

    service elasticsearch start
    ./elasticsearch_migrate.sh  #To perform the initial setup or if you want to reset elasticsearch, but we need it at the beginning to start it. 

After restart :

    . venv/bin/activate
    ./script/start.sh #to start the instance of tor and privoxy

### FLASK :
    . /home/fr../scripts/web.sh   #launch flask to have a web interface

### Cronjobs

    # harvest onions from various sources
    1 18 * * * /home/freshonions-torscraper/scripts/harvest.sh

    # get ssh fingerprints for new sites
    1 4,16 * * * /home/freshonions-torscraper/scripts/update_fingerprints.sh

    # mark sites as genuine / fake from the /r/darknetmarkets superlist
    1 1 * * 1 /home/freshonions-torscraper/scripts/get_valid.sh

    # scrape pastebin for onions (needs paid account / IP whitelisting)
    */5 * * * * /home/freshonions-torscraper/scripts/pastebin.sh

    # portscan new onions
    1 13 * * * /home/freshonions-torscraper/scripts/portscan_up.sh

    # scrape stronghold paste
    32 */2 * * * /home/freshonions-torscraper/scripts/stronghold_paste_rip.sh

    # detect clones
    20 14 * * * /home/freshonions-torscraper/scripts/detect_clones.sh

    #keep a sql dump of data
    1 */1 * * * mysqldump -u username -ppassword --database tor --result-file=/home/dump.sql
    1 */8 * * * mysqldump -u username -ppassword --database tor --result-file=/home/dump_backup.sql


## Infrastructure

Fresh Onions runs on two servers, a frontend host running the database and hidden service web site, and a backend host running the crawler. Probably most interesting to the reader is the setup for the backend. TOR as a client is COMPLETELY SINGLETHREADED. I know! It's 2017, and along with a complete lack of flying cars, TOR runs in a single thread. What this means is that if you try to run a crawler on a single TOR instance you will quickly find you are maxing out your CPU at 100%.

The solution to this problem is running multiple TOR instances and connecting to them through some kind of frontend that will round-robin your requests. The Fresh Onions crawler runs eight Tor instances.

Debian (and ubuntu) comes with a useful program "tor-instance-create" for quickly creating multiple instances of TOR. I used Squid as my frontend proxy, but unfortunately it can't connect to SOCKS directly, so I used "privoxy" as an intermediate proxy. You will need one privoxy instance for every TOR instance. There is a script in "scripts/create_privoxy.sh" to help with creating privoxy instances on debian systems. It also helps to replace /etc/privoxy/default.filter with an empty file, to reduce CPU load by removing unnecessary regexes.

Additionally, this resource https://www.howtoforge.com/ultimate-security-proxy-with-tor might be useful in setting up squid. If all you are doing is crawling and don't care about anonymity, I also recommend running TOR in tor2web mode (required recompilation) for increased speed
