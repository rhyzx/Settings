set fish_greeting ""



#brew path
set BREW_PATH (brew --prefix)
#npm path
set NPM_PATH (npm prefix -g)


#node.js global modules path
set NODE_PATH $NPM_PATH/lib/node_modules
#PATH
set PATH ~/.config/script $BREW_PATH/bin $NPM_PATH/bin $PATH


#git branch prompt config
set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_showstashstate true
# set __fish_git_prompt_showuntrackedfiles true
# set __fish_git_prompt_showupstream true

set __fish_git_prompt_color blue
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_color_stashstate magenta
