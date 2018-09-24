" DO NOT SET anything BASE ON FILETYPE.
" Because if you are here, you are for sure C++.

aug CppSettings
    au!
    " C++11 uniform initialization
    let c_no_curly_error=1

    let g:clang_format#auto_format = 1
    let g:clang_format#code_style = "llvm"
    " https://clang.llvm.org/docs/ClangFormatStyleOptions.html
    let g:clang_format#style_options = {
                \ "AccessModifierOffset" : -4,
                \ "AllowShortIfStatementsOnASingleLine" : "true",
                \ "AllowShortFunctionsOnASingleLine": "Empty",
                \ "AlwaysBreakTemplateDeclarations" : "true",
                \ "BreakBeforeBraces" : "Stroustrup",
                \ "BreakConstructorInitializersBeforeComma": "true",
                \ "IndentCaseLabels": "true",
                \ "IndentWidth": 4,
                \ "MaxEmptyLinesToKeep": 2,
                \ "NamespaceIndentation": "Inner",
                \ "Standard" : "C++11",
                \ "TabWidth": 4}


    " Disable color_coded in diff mode
    if &diff
      let g:color_coded_enabled = 0
    endif

    " ClangFormatAutoEnable is a cmd.
    ClangFormatAutoEnable
    " vim-operator-user
    " https://github.com/kana/vim-operator-user
    " needs to be installed as library.
    map <silent> <buffer> <Leader>xf <Plug>(operator-clang-format)

    setlocal cindent comments=sr:/*,mb:*,el:*/,:// cino=)20,*30,g0
    setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=80
                \ expandtab autoindent fileformat=unix number

    if executable('clangd')
        augroup lsp_clangd
            autocmd!
            autocmd User lsp_setup call lsp#register_server({
                        \ 'name': 'clangd',
                        \ 'cmd': {server_info->['clangd']},
                        \ 'whitelist': ['c', 'cpp'],
                        \ })
            setlocal omnifunc=lsp#complete
        augroup end
    endif

    nmap <buffer> <leader>q :lnext<CR>
    nmap <buffer> <leader>z :lprevious<CR>
    nmap <buffer> <leader>a :lclose<CR>
    nmap <buffer> <leader>E :Errors<CR>
aug end


" Header guards on new .h files
" http://vim.wikia.com/wiki/Automatic_insertion_of_C/C%2B%2B_header_gates


" autocommands to setup settings for different file types
augroup fswitch
    autocmd!

    function! AppendCreate(var, val)
        if exists(a:var)
            let l:lst = split(eval(a:var), ',')
        else
            execute 'let' a:var '=""'
            let l:lst = []
        endif

        let l:val = eval(a:val)
        if index(l:lst, l:val) == -1
            execute 'let' a:var '.=",".' a:val
        endif
    endfunction

    autocmd BufEnter,BufRead *.h call AppendCreate('b:fswitchdst', '"c"')
                              \ | call AppendCreate('b:fswitchdst', '"cc"')
                              \ | call AppendCreate('b:fswitchdst', '"cpp"')
                              \ | call AppendCreate('b:fswitchlocs', '"."')
    autocmd BufEnter,BufRead *.c,*.cc let b:fswitchdst = 'h'
                                   \ | let b:fswitchlocs = '.'
    autocmd BufEnter,BufRead *.hpp let b:fswitchdst = 'cpp'
                                \ | let b:fswitchlocs = '.'
    autocmd BufEnter,BufRead *.cpp let b:fswitchdst = 'hpp,h'
                                \ | let b:fswitchlocs = '.,../include'
    autocmd BufEnter,BufRead *.xaml let b:fswitchdst = 'xaml.cs'
                                 \ | let b:fswitchlocs = '.'
    autocmd BufEnter,BufRead *.xaml.cs let b:fswitchdst = 'xaml'
                                    \ | let b:fswitchfnames = '/\.xaml//'
                                    \ | let b:fswitchlocs = '.'

    let fsnonewfiles="on"
    nnoremap <buffer> <silent> <c-z> :FSHere<cr>

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
augroup end
