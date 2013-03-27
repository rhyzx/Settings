#!/usr/bin/env sh

export http_proxy="http://localhost:8087"

UA=`youtube-dl --dump-user-agent`
TMPD=`mktemp -t tmp -d` || exit 1
COOKIES="$TMPD/cookie"
#INFO=`youtube-dl -o "[%(upload_date)s][%(id)s] %(title)s (by %(uploader)s).%(ext)s" --get-url --get-filename --cookies=123.cookie "$@"`
INFO=`youtube-dl -o "%(title)s.%(ext)s" --get-url --get-filename --cookies="$COOKIES" "$@"`


FILENAME=`echo "$INFO" | tail -n 1 | tr ":\"" ";'" | tr -d "\\\/*?<>|"`
URL=`echo "$INFO" | head -n 1`

aria2c -c -x4 --load-cookies="$COOKIES" -U "$UA" -o "$FILENAME" "$URL"
rm -r "$TMPD"
