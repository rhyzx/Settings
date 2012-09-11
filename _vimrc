set nocp

" Tab related
set ts=4
set sw=4
set smarttab
set et
set ambiwidth=double

" Format related
set tw=78
set lbr
set fo+=mB

" Indent related
set cin
set ai
set cino=:0g0t0(susj1

" Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a
set selectmode=
set mousemodel=popup
set keymodel=
set selection=inclusive

" Misc
set wildmenu
set spell

" Encoding related
set enc=utf-8
set langmenu=en_US.UTF-8
language message en_US.UTF-8
set fencs=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" File type related
filetype plugin indent on

" Display related
set ru
set nu
set sm
set hls
set incsearch
syntax on

if (has("gui_running"))
    set go=     "hide all gui
    colo obsidian2
    set nowrap
    
    if (has("win32"))
        set guifont=Consolas:h11:cANSI
        set guifontwide=NSimSun:h11:cGB2312
    else
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
    endif
else
    colo ron
    set wrap
endif



" =======
" Plugins
" =======
set rtp=~/.vim,$VIMRUNTIME
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()