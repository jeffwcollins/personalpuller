#!/bin/sh
http_proxy="" https_proxy="" wget --no-check-certificate --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36" --tries=1 -O - $1 | grep -E -o '[0-9a-zA_Z]+\.onion'
