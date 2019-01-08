nmap <M-PageUp> 1000k
nmap <S-PageUp> 10000k
nmap <C-PageUp> 100000k
nmap <M-PageDown> 1000j
nmap <S-PageDown> 10000j
nmap <C-PageDown> 100000j

nmap <F9> :%s?/\*\(.*\)\*/?//\1:se commentstring=//%s
nmap <F10> :%s?\/\/\(.*\)?/*\1*/:se commentstring=/*%s*/

"source $HOME/.vim/extraplugin/AlignMaps.vim
"source $HOME/.vim/extraplugin/Align.vim
"source $HOME/.vim/extraplugin/cecutil.vim
"source $HOME/.vim/extraplugin/cscope_macros.vim
source $HOME/.vim/extraplugin/perforce.vim
"source $HOME/.vim/extraplugin/UnMtchBracket.vim
"source $HOME/.vim/extraplugin/increment.vim
"source $HOME/.vim/extraplugin/bufexplorer.vim
