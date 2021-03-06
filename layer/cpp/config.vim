" doxygen
nmap <silent> <Leader>dq :Dox<cr>
nmap <silent> <Leader>dqb :DoxBlock<cr>


" Setup for prabirshrestha/asyncomplete.vim
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1

" let g:asyncomplete_auto_popup = 0
" function! s:check_back_space() abort
    " let col = col('.') - 1
    " return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ <SID>check_back_space() ? "\<TAB>" :
  " \ asyncomplete#force_refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" https://github.com/prabirshrestha/asyncomplete.vim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <a-r> <Plug>(asyncomplete_force_refresh)
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
