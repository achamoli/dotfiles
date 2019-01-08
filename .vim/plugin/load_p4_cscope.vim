command LoadCscope call LoadCscope()
let dummy = system("p4 >& /dev/null")
if (v:shell_error == 0)
    "echom "Loading Perforce Plugin"
    so $HOME/.vim/extraplugin/cscope_macros.vim
    so $HOME/.vimproject_mappings
    set tags=tags;/
    "set colorcolumn=80
    colorscheme peachpuff
    nmap fg <C-\>f
    if has("gui_running")
        winpos 545 28
        set lines=39 columns=165
    endif
"else
    "let g:miniBufExplForceSyntaxEnable = 1
    "so $HOME/.vim/extraplugin/minibufexpl.vim
endif
