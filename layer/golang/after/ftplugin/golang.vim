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
    au FileType go nmap <leader>ds <Plug>(go-def-split)
    au FileType go nmap <leader>dv <Plug>(go-def-vertical)
    au FileType go nmap <leader>dt <Plug>(go-def-tab)
    au FileType go nmap <leader>dd <Plug>(go-def)
    au FileType go nmap <leader>gd <Plug>(go-doc)
    au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
    au FileType go nmap <leader>gb <Plug>(go-doc-browser)
    au FileType go nmap <leader>s <Plug>(go-implements)
    au FileType go nmap <leader>i <Plug>(go-info)
    au FileType go nmap <leader>e <Plug>(go-rename)
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c <Plug>(go-coverage)
"https://stackoverflow.com/questions/1747091/how-do-you-use-vims-quickfix-feature
" C+W p : to previous window
    au FileType go nmap <leader>q :lnext<CR>
    au FileType go nmap <leader>z :lprevious<CR>
    au FileType go nmap <leader>a :lclose<CR>
    au FileType go nmap <leader>ml :GoMetaLinter<CR>
    " Below is used to jump to .go's _test.go files
    " Those are functions call from vim cmd line.
    au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

    " always use BufNewFile && BufRead together :-)
    au BufNewFile,BufRead *.go setlocal
                \ noexpandtab
                \ tabstop=4
                \ shiftwidth=4
                \ number
augroup END
