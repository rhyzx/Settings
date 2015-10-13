#!/usr/bin/env sh
# DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DIR=$( cd "$( dirname "$0" )" && pwd )

# ssh
ln -s $DIR/.ssh ~/

# bin
ln -s $DIR/.bin ~/

# git
ln -s $DIR/.gitconfig ~/
ln -s $DIR/.gitignore_global ~/

# fish
mkdir -p ~/.config/fish
ln -s $DIR/.config/fish/config.fish ~/.config/fish/
ln -s $DIR/.config/fish/functions ~/.config/fish/

# others
ln -s $DIR/.curlrc ~/
ln -s $DIR/.gemrc ~/
ln -s $DIR/.npmrc ~/
ln -s $DIR/.polipo ~/
ln -s $DIR/.proxychains ~/

mkdir -p ~/.ShadowsocksX
ln -s $DIR/.ShadowsocksX/user-rule.txt ~/.ShadowsocksX/


####
# ln -s $DIR/.vimrc ~/
# ln -s $DIR/.bash_profile ~/

## TODO unlink
# if [ -L /home/nit/a.c ] ; then
#     echo "a.c is a symbolic link"
# fi
