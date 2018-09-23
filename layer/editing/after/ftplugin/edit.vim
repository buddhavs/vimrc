" auto change local windows directory to current file directory
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * silent! lcd %:p:h
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
