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

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc,*.out,*.so,*.swp,*.zip


" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" TAB setting
set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4
syntax on               " syntax highlight
