hi SpellBad cterm=underline

augroup TxtRelated
    autocmd!
    autocmd BufNewFile,BufRead *.txt,*.doc setlocal spell spelllang=en_us
augroup END


augroup OtherLangRelated
    autocmd!
    au BufNewFile,BufRead *.js, *.html, *.css
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
        \ number
augroup END


" auto reload vimrc when editing the file
" autocmd! bufwritepost .vimrc source ~/.vimrc


" Enable omni completion. (Ctrl-X Ctrl-O)
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType c setlocal omnifunc=ccomplete#Complete
"autocmd FileType java setlocal omnifunc=javacomplete#Complete


" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
     \	if &omnifunc == "" |
     \		setlocal omnifunc=syntaxcomplete#Complete |
     \	endif
endif


set cot-=preview "disable doc preview in omnicomplete


" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest


" Limit popup menu height
set pumheight=15


"---------------------------------------------------------------------------
" Doxygen support highlight
" http://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
"---------------------------------------------------------------------------
augroup DoxygenRelated
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
