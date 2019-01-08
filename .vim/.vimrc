set nocompatible
set backspace=indent,eol,start
set history=100		" keep 100 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set foldmethod=marker
map Q gq
filetype plugin indent on
augroup vimrcEx
au!
autocmd FileType text set localtextwidth=78
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

if !exists("syntax_on")
  syntax on
endif
augroup END

set ignorecase
set smartcase
set hlsearch
set incsearch
"au BufRead,BufNewFile *.cpp,*.cc,*.h,*.hh so ~ashishc/.vim/after/syntax/c/blockhl.vim
au BufRead,BufNewFile *.upf so ~ashishc/.vim/syntax/upf.vim
au BufRead,BufNewFile *.c,*.h,*.cc,*.hh so ~ashishc/.vim/syntax/stl.vim
nmap YY "*yy
nmap PP "*p
nmap Y y$
set tabstop=4
set expandtab
set shiftwidth=4
set ai
set wmh=0
set wmw=0
set noeb

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
"imap <Tab> 
nmap <F1> :w!<CR>
"nmap <F4> :%s/	/  /g:noh:w!
nmap <BS> :e#<CR>
"nmap <Space> za
"nmap <F9> kA<CR>{<Esc>jA<CR>}<Esc>
nmap <F2> gT
nmap <F3> gt
nmap <F12> :bn!<CR>
nmap <F11> :bp!<CR>
nmap <F5> :se mouse=a<CR>
nmap <F6> :se mouse=""<CR>
nmap <F7> :se nu<CR>
nmap <F8> :se nonu<CR>
nmap  c

:vmap * y:execute "/".escape(@",'[]/\.*')
set visualbell t_vb=

set titlestring=%t
"set mouse=a
set noea
set nows

"" have command-line completion <Tab> (for filenames, help topics, option names)
"" first list the available options and complete the longest common part, then
"" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

function! g:toggleTabMap()
  if (mapcheck("<Tab>", "i") == "")
      imap <Tab> <C-P>
  else
      iunmap <Tab>
  endif
endfunction
command! TT call g:toggleTabMap()
map <C-S> :call g:toggleTabMap()<CR>

set undolevels=1000
set textwidth=79
"set colorcolumn=80
set encoding=utf-8
set fileencoding=utf-8
set list listchars=tab:»·

map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Right> <C-W>l
map <C-Left> <C-W>h

map <C-_> <C-W>_
nmap <C-F4> :bd!<CR>
vmap <C-X> "xd
nmap <C-P> "xp

let c_comment_strings=1
imap <C-BS> 

nmap <C-N> :tabnew %<CR>

set guitablabel=\[%N\]%t
set titlestring=%t
set hidden	"hide buffers when you delete them rather than actually deleting
