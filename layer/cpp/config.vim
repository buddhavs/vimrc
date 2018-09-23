" doxygen
nmap <silent> <Leader>dq :Dox<cr>
nmap <silent> <Leader>dqb :DoxBlock<cr>


" Setup for prabirshrestha/asyncomplete.vim
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction


inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" switch to the file and load it into the current window
nnoremap <silent> <leader>of :FSHere<cr>

" in current window
nnoremap <silent> <leader>oo :FSHere<cr>
" in a new tab
nnoremap <silent> <leader>ot :call FSwitch('%', 'tabedit')<cr>
" in a new tab opened before this one
nnoremap <silent> <leader>oT :call FSwitch('%', "<c-r>=tabpagenr()-1<cr>tabedit")<cr>

" switch to the file and load it into the window on the right
nnoremap <silent> <leader>ol :FSRight<cr>

" switch to the file and load it into a new window split on the right
nnoremap <silent> <leader>oL :FSSplitRight<cr>

" switch to the file and load it into the window on the left
nnoremap <silent> <leader>oh :FSLeft<cr>

" switch to the file and load it into a new window split on the left
nnoremap <silent> <leader>oH :FSSplitLeft<cr>

" switch to the file and load it into the window above
nnoremap <silent> <leader>ok :FSAbove<cr>

" switch to the file and load it into a new window split above
nnoremap <silent> <leader>oK :FSSplitAbove<cr>

" switch to the file and load it into the window below
nnoremap <silent> <leader>oj :FSBelow<cr>

" switch to the file and load it into a new window split below
nnoremap <silent> <leader>oJ :FSSplitBelow<cr>

