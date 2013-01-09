set fish_greeting ""



#brew path
set BREW_PATH (brew --prefix)
#npm path
set NPM_PATH (npm prefix -g)


#node.js global modules path
set -x NODE_PATH $NPM_PATH/lib/node_modules
#PATH
set -x PATH ~/.config/script $BREW_PATH/bin $BREW_PATH/sbin $NPM_PATH/bin $PATH


