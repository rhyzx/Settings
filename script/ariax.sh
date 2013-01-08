#!/bin/sh
url = $1;
output = $2;

cookies = (sqlite3 -separator $'\t' ~/Library/Application\ Support/Google/Chrome/Default/Cookies "select host_key, 'TRUE','/', 'FALSE', expires_utc, name, value from cookies where host_key like '%$1%'") > $2

aria2c --header "Cookie: "
