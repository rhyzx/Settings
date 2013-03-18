let $DIR    = "~/.config"

set rtp=$DIR,$VIMRUNTIME
runtime vim-bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect("vim-bundle")


set nocp
set history=512
set dir=$TEMP,$TMP,$TMPDIR

" Tab
set ts=4 sw=4 et
set smarttab
set ambiwidth=double

" Format
" set tw=78
set lbr
set fo+=mB

" Indent
set ai "cin
set cino=:0g0t0(susj1

" Editing
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

" Encoding
set enc=utf-8
" default is usc-bom,utf-8,default,latin1
"set fencs=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=en_US.UTF-8
language message en_US.UTF-8

set ffs=unix,dos,mac
set ff=unix

" File type
filetype plugin indent on
autocmd BufRead,BufNewFile *.less set filetype=css syntax=less
autocmd BufRead,BufNewFile *.less setlocal si nocin

" Display
set ru nu sm hls incsearch
syntax on

" IM
"set noimdisable
"set iminsert=0
"set imsearch=0

" UI
if (has("gui_running"))
    set go=     "hide all gui
    colo obsidian2
    set nowrap
    
    if (has("win32"))
        set guifont=Consolas:h11:cANSI
        set guifontwide=NSimSun:h11:cGB2312
    elseif (has("mac"))
        set go=e
        set guifont=Menlo:h13
    else
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
    endif
else
    colo ron
    set wrap
endif

" Session
"set ssop=tabpages,blank,slash,unix ",buffers,sesdir
"if filereadable($HOME . '/.vimss')
"    au VimEnter * nested source ~/.vimss
"endif
"au VimLeave * mks! ~/.vimss




" ======
" Maps
" ======
let mapleader = ","

" Esc
" inoremap <ESC>  <nop> "restrict use
inoremap <CR>   <ESC>
vnoremap <CR>   <ESC>
inoremap <C-CR> <END><CR>

" Tab pages control
nmap <silent> <C-h>      :tabprevious<CR>
nmap <silent> <C-l>      :tabnext<CR>
" for win
nmap <silent> <C-t>      :tabnew<CR>
" for mac
nmap <silent> <D-A-LEFT>   :tabprevious<CR>
nmap <silent> <D-A-RIGHT>  :tabnext<CR>

" Window control
nmap <C-TAB> <C-w>w
nmap <C-S-TAB> <C-w>W

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

" Delete
imap <S-BS> <DEL>
imap <C-BS> <C-o>daw

" Win paste
imap <C-V> <C-r>+

" No hilight search
nmap <silent> // :noh<CR>

" Save as
cnoreabbrev W saveas

" Current file name
cnoreabbrev - <C-R>=@%<CR>

" Autoclose
"inoremap ( ()i
"inoremap ) =ClosePair(')')
"inoremap { {}i
"inoremap } =ClosePair('}')
"inoremap [ []i
"inoremap ] =ClosePair(']')
"inoremap < <>i
"inoremap > =ClosePair('>')

"function ClosePair(char)
   "if getline('.')[col('.') - 1] == a:char
       "return "\"
   "else
       "return a:char
   "endif
"endf

" ======
" Misc
" ======

" Display special chars
nmap <Leader>l  :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Quick edit/reload vimrc
" nmap <Leader>v  :tabedit ~/.vim/vimrc<CR>
nmap <Leader>v  :tabedit $MYVIMRC<CR>
nmap <Leader>s  :source  $MYVIMRC<CR> "error

" Quick edit cheat
nmap <Leader>c  :tabedit $DIR/misc/vim-cheat.md<CR>



" =======
" Plugins
" =======
map <silent> <Leader>n   :NERDTreeToggle<CR>
map <silent> <Leader>b   :NERDTree<CR>
map <silent> <Leader>m   :MRU<CR>

set laststatus=2 "Powerline

" UltiSnips
let g:UltiSnipsExpandTrigger        = "<tab>"
let g:UltiSnipsJumpForwardTrigger   = "<tab>"
let g:UltiSnipsJumpBackwardTrigger  = "<s-tab>"

let g:UltiSnipsEditSplit            = "vertical"        " edit in split window
let g:UltiSnipsSnippetsDir          = $DIR ."/vim-snippet" " custom snippets dir
let g:UltiSnipsSnippetDirectories   = ["vim-snippet"]   " only use custom snippets

" CtrlP
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|exe|swp)$',
  \ }


" =========
" Functions
" =========




" ========
" Test
" ========

" @TODO
" <C-y>i : insert template var // {{?}} // or just expand '{' by zen?

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

