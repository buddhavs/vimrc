augroup YamlRelated
    autocmd!
    au BufNewFile,BufRead *.yaml setlocal
                \ noexpandtab
                \ tabstop=2
                \ shiftwidth=2
                \ number
augroup END
