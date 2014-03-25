# fish_user_paths does not override path in current version
# it will be fixed in next release
# @see https://github.com/fish-shell/fish-shell/issues/1099
set PATH ~/.config/script /usr/local/bin /usr/local/sbin /usr/local/share/npm/bin /Users/rhyzx/.rbenv/shims /usr/bin /bin /usr/sbin /sbin 


# improve speed by confiuring one time
# reload by `set -eU FISHING`
if not set -qU FISHING
set -U FISHING 1

set -U fish_greeting ""


# tmp vars
set -l brew (brew --prefix)
set -l npm (npm prefix -g)
set -l rbenv (rbenv root)


# prepend PATH
set -U fish_user_paths ~/.config/script $brew/bin $brew/sbin $npm/bin $rbenv/shims

# Perl5 lib for git svn
set -Ux PERL5LIB "/Applications/Xcode.app/Contents/Developer/Library/Perl/5.16/darwin-thread-multi-2level"
# node.js global modules path
set -Ux NODE_PATH $npm/lib/node_modules
# python modules
set -Ux PYTHONPATH $brew/lib/python2.7/site-packages


# git branch prompt config
set -U __fish_git_prompt_showdirtystate true
set -U __fish_git_prompt_showstashstate true
#set -U __fish_git_prompt_showuntrackedfiles true
#set -U __fish_git_prompt_showupstream true

# git state color
# prefix/suffix/bare/merging/branch/stagedstate/invalidstate/untrackedfiles/upstream
set -U __fish_git_prompt_color magenta
#set -U __fish_git_prompt_color_dirtystate red
#set -U __fish_git_prompt_color_stashstate blue

# git state char
# upstream_equal/ahead/behind/diverged
set -U ___fish_git_prompt_char_dirtystate '👾 '
set -U ___fish_git_prompt_char_stashstate '🍳 '
set -U ___fish_git_prompt_char_stagedstate '🌀 '

end