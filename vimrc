" Forked from https://github.com/jeaye/vimrc
" Author: jsc9530@gmail.com

" No vi compatibility
set nocompatible
let g:hostname = substitute(system('hostname'), "\n", "", "")

source $HOME/.vim/layer/all-packages.vim

" https://vi.stackexchange.com/a/10125
" Same as:
" filetype on
" filetype plugin on
" filetype indent on
filetype plugin indent on
