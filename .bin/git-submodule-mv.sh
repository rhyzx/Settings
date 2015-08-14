#!/bin/sh

#USAGE
#git submodule update --init --recursive
#/path/this.sh

#TODO
#git-submodule-mv foo/mod	bar/xod	move mod to bar name xod
#git-submodule-mv foo/mod	bar/	move mod to bar
#git-submodule-mv foo/		bar/	move all in foo to bar
#git-submodule-mv bar/				move all to bar
for m in `git submodule`; do
	if [ -d $m ]; then
		pushd $m 	> /dev/null
			url=$(git config remote.origin.url)
			name=$(basename $m)
		popd		> /dev/null

		rm -rf $m
		git rm $m
		git submodule add $url vim-bundle/$name
		#echo $url $name
	fi
done

echo "done"