set autoindent smartindent
set backspace=indent,eol,start
" set diffopt+=internal,algorithm:patience

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
setlocal colorcolumn=80
hi ColorColumn ctermbg=lightblue guibg=blue


aug GlobalEditing
    au!
    " auto change local windows directory to current file directory
    " http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
    autocmd BufEnter * silent! lcd %:p:h
    autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

    " --- move around splits {
    " move to and maximize the below split
    noremap <c-j> <C-W>j<C-W>_
    " move to and maximize the above split
    noremap <c-k> <C-W>k<C-W>_
    " move to and maximize the left split
    nnoremap <c-h> <c-w>h<c-w><bar>
    " move to and maximize the right split
    nnoremap <c-l> <c-w>l<c-w><bar>

    " move around tabs. conflict with the original screen top/bottom
    " comment them out if you want the original H/L
    "go to prev tab
    " nnoremap <C-t><C-n> gT
    "go to next tab
    " nnoremap <C-t><C-p> gt
    " new tab
    nnoremap <C-t><C-t> :tabnew<CR>
    " close tab
    nnoremap <C-t><C-w> :tabclose<CR>

    " http://superuser.com/questions/410982/in-vim-how-can-i-quickly-switch-between-tabs
    " Go to tab by number
    nnoremap <leader>1 1gt
    nnoremap <leader>2 2gt
    nnoremap <leader>3 3gt
    nnoremap <leader>4 4gt
    nnoremap <leader>5 5gt
    nnoremap <leader>6 6gt
    nnoremap <leader>7 7gt
    nnoremap <leader>8 8gt
    nnoremap <leader>9 9gt
    nnoremap <leader>0 :tablast<cr>


    " Go to last active tab
    let g:lasttab = 1
    nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
    vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
    au TabLeave * let g:lasttab = tabpagenr()


    " ,/ turn off search highlighting
    nnoremap <leader>/ :nohl<CR>


    " Bash like keys for the command line
    cnoremap <C-A>      <Home>
    cnoremap <C-E>      <End>
    cnoremap <C-K>      <C-U>

    " ,p toggles paste mode
    "set paste
    nmap <leader>p :set paste!<BAR>set paste?<CR>

    " allow multiple indentation/deindentation in visual mode
    vnoremap < <gv
    vnoremap > >gv

    " :cd. change working directory to that of the current file
    cnoremap <silent> cd. lcd %:p:h
    " nnoremap ,cd :cd %:p:h<CR>
    " nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

    " Move to next new line instead of enter insert mode
    noremap <S-Enter> O<Esc>
    noremap <CR> o<Esc>

    " Show line number
    nnoremap <silent> <leader>N :set number!<CR>

    " Show buffers
    nnoremap <F5> :buffers<CR>:buffer<Space>

    " Taggle Read Only
    nnoremap <silent> <leader>ro :set ro!<CR>

    " Show full path file name
    nnoremap <C-h> :echo expand('%:p')<CR>

    nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
    nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

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

    nnoremap <leader>j :call GotoJump()<CR>

    function! SetColorColumn()
        " let col_num = virtcol(".")
        let col_num = 80
        let cc_list = split(&cc, ',')
        if count(cc_list, string(col_num)) <= 0
            execute "set cc+=".col_num
        else
            execute "set cc-=".col_num
        endif
    endfunction

    noremap <leader>ch :call SetColorColumn()<CR>
aug end
