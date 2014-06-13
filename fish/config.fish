# fish_user_paths does not override path in current version
# it will be fixed in next release
# @see https://github.com/fish-shell/fish-shell/issues/1099
set PATH ~/.config/scripts /usr/local/bin /usr/local/sbin /usr/local/var/ruby/bin /usr/bin /bin /usr/sbin /sbin


# improve speed by cache confiuration
# reload by `set -eU FISHING`
if not set -qU FISHING
set -U FISHING 1
set fish_greeting ""

set -l p ~/.config/scripts

# TODO
# check exists

# brew (main)
set -l brew (brew --prefix)
set p $p $brew/bin $brew/sbin



# nodejs/npm
set -l npm (npm prefix -g)

## nodejs global modules path
set -Ux NODE_PATH $npm/lib/node_modules



# ruby
## shared gems install path
set -Ux GEM_HOME /usr/local/var/ruby
set -Ux GEM_PATH $GEM_HOME
set p $p $GEM_PATH/bin

# ## rbenv
# set -Ux RBENV_ROOT /usr/local/var/rbenv
# set -l rbenv (rbenv root)




# python modules
set -Ux PYTHONPATH $brew/lib/python2.7/site-packages



# Perl5 lib for git svn
set -Ux PERL5LIB "/Applications/Xcode.app/Contents/Developer/Library/Perl/5.16/darwin-thread-multi-2level"



# git
## git branch prompt config
set -U __fish_git_prompt_showdirtystate true
set -U __fish_git_prompt_showstashstate true
#set -U __fish_git_prompt_showuntrackedfiles true
#set -U __fish_git_prompt_showupstream true

## git state color
## prefix/suffix/bare/merging/branch/stagedstate/invalidstate/untrackedfiles/upstream
set -U __fish_git_prompt_color magenta
#set -U __fish_git_prompt_color_dirtystate red
#set -U __fish_git_prompt_color_stashstate blue

## git state char
## upstream_equal/ahead/behind/diverged
set -U ___fish_git_prompt_char_dirtystate '👾 '
set -U ___fish_git_prompt_char_stashstate '🍳 '
set -U ___fish_git_prompt_char_stagedstate '🌀 '


# prepend to PATH
set fish_user_paths $p
end

