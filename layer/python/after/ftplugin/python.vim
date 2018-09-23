" gf to open files. replace . with /
set includeexpr=substitute(v:fname,'\\.','/','g')

augroup PythonRelated
    au!
    autocmd BufNewFile,BufRead *.py setlocal
                \ noexpandtab
                \ tabstop=4
                \ shiftwidth=4
                \ softtabstop=4
                \ textwidth=80
                \ expandtab
                \ autoindent
                \ fileformat=unix
                \ number
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType python setlocal omnifunc=python3complete#Complete
augroup END

