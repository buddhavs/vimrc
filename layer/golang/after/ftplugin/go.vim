" http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean
" http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
" http://learnvimscriptthehardway.stevelosh.com/chapters/02.html
" use ? to see the option value
" use ! to toggle the option value
"
" https://stackoverflow.com/a/12625504
" use ! on function! will replace previous function definition.
" autocmd is about adding commands into a command list, thus it accumulates!


augroup GolangSettings
    " must use autocmd! to clear the augroup cmds.
    autocmd!
    nmap <buffer> <leader>ds <Plug>(go-def-split)
    nmap <buffer> <leader>dv <Plug>(go-def-vertical)
    nmap <buffer> <leader>dt <Plug>(go-def-tab)
    nmap <buffer> <leader>dd <Plug>(go-def)
    nmap <buffer> <leader>gd <Plug>(go-doc)
    nmap <buffer> <leader>gv <Plug>(go-doc-vertical)
    nmap <buffer> <leader>gb <Plug>(go-doc-browser)
    nmap <buffer> <leader>s <Plug>(go-implements)
    nmap <buffer> <leader>i <Plug>(go-info)
    nmap <buffer> <leader>e <Plug>(go-rename)
    nmap <buffer> <leader>r <Plug>(go-run)
    nmap <buffer> <leader>b <Plug>(go-build)
    nmap <buffer> <leader>t <Plug>(go-test)
    nmap <buffer> <leader>c <Plug>(go-coverage)
"https://stackoverflow.com/questions/1747091/how-do-you-use-vims-quickfix-feature
" C+W p : to previous window
    " nmap <buffer> <leader>q :lnext<CR>
    " nmap <buffer> <leader>z :lprevious<CR>
    " nmap <buffer> <leader>a :lclose<CR>
    nmap <buffer> <leader>q :cnext<CR>
    nmap <buffer> <leader>z :cprevious<CR>
    nmap <buffer> <leader>a :cclose<CR>
    nmap <buffer> <leader>ml :GoMetaLinter<CR>
    " Below is used to jump to .go's _test.go files
    " Those are functions call from vim cmd line.
    command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

    setlocal expandtab tabstop=4 shiftwidth=4 number
augroup end
