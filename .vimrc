
"============== Old Settings Start ==============
"
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set history=100	                " keep 100 lines of command line history
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set ai                          " Auto Indent
set tabstop=2                   " Tab Stop Length
set expandtab                   " Expand tabs to spaces
set shiftwidth=2                " ShiftWidht << & >>
set wmh=0                       " When minimizing windows
set wmw=0                       " When minimizing windows
set noeb                        " Disable error bell
set visualbell t_vb=            " Visual Bell - Flash screen
set titlestring=%t
"set guitablabel=\[%N\]%t        " Show tab number in title
set noea                        " equalalways - do not resize all windows when closing one
set colorcolumn=80              " Vertical line at column 80
let c_comment_strings=1         " Turn off syntax highlighting within C++ comments
se tw=0                         " No textwrapping

"Better Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set wrapscan

" To differentiate between insert mode and normal mode
if has("autocmd")
  autocmd InsertEnter * set cul
  autocmd InsertLeave * set nocul
endif
if !exists("syntax_on")
  syntax on
endif
" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
"set wildmode=list:longest,full


"Maps
:vmap * y:execute "/".escape(@",'[]/\.*')
nmap <BS> :e#<CR>
vmap <C-X> "xd
nmap <C-P> "xp
nmap <C-N> :tabnew %<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
"nmap <D-Left> gT
"nmap <D-Right> gt
"imap <D-Left> gT
"imap <D-Right> gt
"nmap OD gT
"nmap OC gt

"Reload Tabs
function! g:Reload_tabs()
  tabdo :e!
endfunction
command! R call g:Reload_tabs()

"When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
augroup vimrcEx
au!
"autocmd FileType text set localtextwidth=0
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

if !exists("syntax_on")
  syntax on
endif
augroup END

"Syntax
au BufRead,BufNewFile *.upf so ~ashishc/.vim/syntax/upf.vim
au BufRead,BufNewFile *.c,*.h,*.cc,*.hh so ~ashishc/.vim/syntax/stl.vim

"Copy Paste
nmap YY "*yy
nmap PP "*p
nmap Y y$

source $HOME/.vim/extraplugin/cscope_macros.vim
set tags=tags;/
"============== Old Settings End ==============

"FB Specific
source ~ashishc/.vimrc_fb


"Install and setup plugins
source ~ashishc/.vimrc_vundle

"======================= On Save Events ===========================
"" Format Targets
autocmd BufWritePost TARGETS silent! exec "!~/fbsource/tools/third-party/buildifier/run_buildifier.py -i %" | :e

" ====== clang format ======
map <C-F> :pyf /usr/local/share/clang/clang-format.py<CR>
imap <C-F> <ESC>:pyf /usr/local/share/clang/clang-format.py<CR>i

""Tabline Function
"function! MyTabLine()
"    let s = ''
"    for i in range(tabpagenr('$'))
"        let tabnr = i + 1 " range() starts at 0
"        let winnr = tabpagewinnr(tabnr)
"        let buflist = tabpagebuflist(tabnr)
"        let bufnr = buflist[winnr - 1]
"        let bufname = fnamemodify(bufname(bufnr), ':t')
"
"        let s .= '%' . tabnr . 'T'
"        let s .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
"        let s .= ' ' . tabnr . ']'
"
"        let n = tabpagewinnr(tabnr,'$')
"        if n > 1 | let s .= ':' . n | endif
"
"        "let s .= empty(bufname) ? ' [No Name] ' : ' ' . bufname . ' '
"        let s .= empty(bufname) ? ' [No Name] ' : bufname
"
"        let bufmodified = getbufvar(bufnr, "&mod")
"        if bufmodified | let s .= '+ ' | endif
"    endfor
"    let s .= '%#TabLineFill#'
"    return s
"endfunction
"set tabline=%!MyTabLine()

function! g:SetCP()
  imap <Tab> <C-P>
endfunction
function! g:SetAC()
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
endfunction

command! TCP call g:SetCP()
command! TT iunmap <Tab>
command! TAC call g:SetAC()

"function! g:ToggleTabMap()
"  if (mapcheck("<Tab>", "i") == "")
"      imap <Tab> <C-P>
"  else
"      iunmap <Tab>
"  endif
"endfunction
"command! TT call g:ToggleTabMap()
"map <C-S> :call g:ToggleTabMap()<CR>
"call g:ToggleTabMap()

"Junked Old Vim Settings
source ~ashishc/.vimrc_junked

"Better Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set wrapscan
se tw=0                         " No textwrapping

set wildmode=list:longest,full
