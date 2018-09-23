Plug 'terryma/vim-multiple-cursors'
" [v, ]v
Plug 'bruno-/vim-vertical-move'

Plug 'scrooloose/nerdtree'
" code commenter
Plug 'scrooloose/nerdcommenter'

Plug 'jistr/vim-nerdtree-tabs'

" enable opening a file in a given line
Plug 'bogado/file-line'

" for dir file search
" Plug 'ctrlpvim/ctrlp.vim'
" let g:ctrlp_map = '<leader>cp'
" Ignore these directories
" set wildignore+=*/build/**
" disable caching
" let g:ctrlp_use_caching = 1
" let g:ctrlp_working_path_mode = 'ra'
" auto set workdir root

" function! s:setcwd()
    " let cph = expand('%:p:h', 1)
    " if cph =~ '^.\+://' | retu | en
    " for mkr in ['.git/', '.hg/', '.svn/', '.bzr/', '_darcs/', '.vimprojects']
      " let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
      " if wd != '' | let &acd = 0 | brea | en
    " endfo
    " exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
" endfunction

" augroup CtrlpRelated
"    autocmd!
"    autocmd BufEnter * call s:setcwd()
" augroup END

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
