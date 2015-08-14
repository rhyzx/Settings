#!/usr/bin/env bash

# TODO
# - files
# - main text name: Default Main others…
#   caculate max?

for file in *.ass
	do
	if [ -e "tmp" ]
		then
		echo "error: tmp file exists"
		break
	fi
	filename=$(basename "$file")
	ext="${filename##*.}"
	name="${filename%.*}"
	encoding=$(enca -L zh_CN -m "$file")
	# cat "$file" | iconv -f $encoding -t utf-8 | awk '/^Dialogue: /&&!/Default/{$0="; "$0} 1' > "$name.normalized.$ext"
	cat "$file" | iconv -f $encoding -t utf-8 | sed -e '1i [Script Info]' > "tmp"
	# cat "$file" | iconv -f $encoding -t utf-8 | sed -e '/^Dialogue: 0,0:00:00\.00,0:00:00\.00,/d' > "tmp"
	mv "tmp" "$filename"
done
