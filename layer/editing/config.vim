set autoindent smartindent
set backspace=indent,eol,start


" https://github.com/ntpeters/vim-better-whitespace
let g:better_whitespace_ctermcolor='red'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1


map <C-Z> :set go-=L \| set go+=l \| NERDTree<CR>
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1


"---------------------------------------------------------------------------
" Indent Guides
" http://goo.gl/qfF9od
" http://www.vim.org/scripts/script.php?script_id=3361
"---------------------------------------------------------------------------
let g:indent_guides_guide_size=1
set colorcolumn=80
hi ColorColumn ctermbg=lightblue guibg=blue


map <leader>ch :call SetColorColumn()<CR>
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction


"---------------------------------------------------------------------------
" Jump to location
" http://vim.wikia.com/wiki/Jumping_to_previously_visited_locations
"---------------------------------------------------------------------------
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

nmap <leader>j :call GotoJump()<CR>
