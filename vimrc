set rtp=~/.vim,$VIMRUNTIME
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


set nocp
set history=512
set dir=$TEMP

" Tab related
set ts=4 sw=4 et
set smarttab
set ambiwidth=double

" Format related
set tw=78
set lbr
set fo+=mB

" Indent related
" set cin
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
set nospell
set autochdir

" Encoding related
set enc=utf-8
set fencs=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=en_US.UTF-8
language message en_US.UTF-8

set ffs=unix,dos,mac
set ff=unix

" File type related
filetype plugin indent on
autocmd BufRead,BufNewFile *.less set filetype=css syntax=less

" Display related
set ru nu sm hls incsearch
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

" Session
set ssop=tabpages,blank,slash,unix ",buffers,sesdir
if filereadable($HOME . '/.vimss')
    au VimEnter * nested source ~/.vimss
endif
au VimLeave * mks! ~/.vimss


" =================
let mapleader = ","


" ======
" Combos
" ======

" Tab pages control
nmap <silent> <C-h>      :tabprevious<CR>
nmap <silent> <C-S-TAB>  :tabprevious<CR>
nmap <silent> <C-l>      :tabnext<CR>
nmap <silent> <C-TAB>    :tabnext<CR>
nmap <silent> <C-t>      :tabnew<CR>

" Indent control
nnoremap <TAB>      >>
nnoremap <S-TAB>    <<
vnoremap <TAB>      >gv
vnoremap <S-TAB>    <gv

" Line(s) move up/down
nnoremap <silent> <C-k>  :m-2<CR>==
nnoremap <silent> <C-j>  :m+<CR>==
xnoremap <silent> <C-k>  :m'<-2<CR>gv=gv
xnoremap <silent> <C-j>  :m'>+<CR>gv=gv

" Display special chars
nmap <Leader>l  :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Quick edit vimrc
nmap <Leader>v  :tabedit ~/.vim/vimrc<CR>

" Quick edit @VIM_CHEAT
nmap <Leader>c  :tabedit ~/.vim/@VIM_CHEAT.txt<CR>

" Dupliate line
" @TODO

" Win paste
imap <C-V> <ESC>"+pa

" =======
" Plugins
" =======
map <silent> <Leader>m   :NERDTreeToggle<CR>

set laststatus=2 "Powerline


" =========
" Functions
" =========







" ========
" Tests
" ========

" Auto reload vimrc
" @TODO


" Tabline
" set tabline=%!MyTabLine()
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction
    
function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction

