" normal mode / visual mode
" start: <C-n> start multicursor and add a virtual cursor + selection on the match
" next: <C-n> add a new virtual cursor + selection on the next match
" skip: <C-x> skip the next match
" prev: <C-p> remove current virtual cursor + selection and go back on previous match
" select all: <A-n> start muticursor and directly select all matches
" You can now change the virtual cursors + selection with visual mode commands.
" For instance: c, s, I, A work without any issues.
" You could also go to normal mode by pressing v and use normal commands there.

" At any time, you can press <Esc> to exit back to regular Vim.

" NOTE: start with g<C-n> to match without boundaries (behaves like g* instead of *)

" visual mode when multiple lines are selected
" start: <C-n> add virtual cursors on each line
" You can now change the virtual cursors with normal mode commands.
" For instance: ciw.

" command
" The command MultipleCursorsFind accepts a range and a pattern (regexp), it creates a visual cursor at the end of each match.
" If no range is passed in, then it defaults to the entire buffer.
Plug 'terryma/vim-multiple-cursors'

Plug 'scrooloose/nerdtree'

" code commenter
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'


" enable opening a file in a given line
Plug 'bogado/file-line'

Plug 'ntpeters/vim-better-whitespace'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
