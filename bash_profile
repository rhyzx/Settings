export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#term title
export PROMPT_COMMAND='echo -ne "\\033]0;${PWD/#$HOME/~}\\007"'


#brew path
export BREW_PATH=`brew --prefix`

#PATH
export PATH=~/.vim/shells:${BREW_PATH}/bin:${BREW_PATH}/sbin:${BREW_PATH}/share/npm/bin:${PATH}
#PATH for NODE global modules
export NODE_PATH=${BREW_PATH}/share/npm/lib/node_modules


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# completion of brew's programs
if [ -f ${BREW_PATH}/etc/bash_completion ]; then
    . ${BREW_PATH}/etc/bash_completion
fi

#Git branch hilight
#PS1='\h:\W \u\$' #default
#PS1=$PS1'`B=$(git branch 2>/dev/null | sed -e "/^ /d" -e "s/* \(.*\)/\1/"); if [ "$B" != "" ]; then S="git"; elif [ -e .bzr ]; then S=bzr; elif [ -e .hg ]; then S="hg"; elif [ -e .svn ]; then S="svn"; else S=""; fi; if [ "$S" != "" ]; then if [ "$B" != "" ]; then M=$S:$B; else M=$S; fi; fi; [[ "$M" != "" ]] && echo -n -e "\[\e[33;40m\]($M)\[\033[01;32m\]\[\e[00m\]"`'
PS1="\h:\W\[\e[0;32m\]\$(__git_ps1)\[\e[00m\] \u\$ "

# rbenv
if [ -f ${BREW_PATH}/bin/rbenv ]; then
    eval "$(rbenv init -)"
fi
