aug GlobalLint
    au!
    " https://github.com/w0rp/ale#usage-linting
    let g:ale_list_window_size = 5
    let g:airline#extensions#ale#enabled = 0
    let g:ale_fix_on_save = 1
    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace']
    \ }
    " Write this in your vimrc file
    let g:ale_lint_on_text_changed = 'never'
    " You can disable this option too
    " if you don't want linters to run on opening a file
    let g:ale_lint_on_enter = 0
    let g:ale_lint_on_save = 1

    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)

    " let g:ale_set_loclist = 0
    "
    let g:ale_set_quickfix = 1
    let g:ale_open_list = 1

    " Set this if you want to.
    " This can be useful if you are combining ALE with
    " some other plugin which sets quickfix errors, etc.
    let g:ale_keep_list_window_open = 0

aug end
