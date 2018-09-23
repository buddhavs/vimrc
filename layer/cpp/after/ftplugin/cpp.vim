nmap <silent> <c-z> :FSHere<cr>
let fsnonewfiles="on"

" C++11 uniform initialization
let c_no_curly_error=1

" Disable color_coded in diff mode
if &diff
  let g:color_coded_enabled = 0
endif

" Header guards on new .h files
function! s:insert_gates()
  execute "normal! i#pragma once"
  normal! gg
endfunction


function! ClangFormatFunc()
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
endfunction


if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
    augroup end
endif


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


augroup CppSettings
    autocmd!
    autocmd FileType c,cpp,h,hpp ClangFormatAutoEnable
    " map to <Leader>xf in C++ code
    autocmd FileType c,cpp,h,hpp nnoremap <buffer><Leader>xf :<C-u>ClangFormat<CR> zz
    autocmd FileType c,cpp,h,hpp vnoremap <buffer><Leader>xf :ClangFormat<CR> zz
    " format line +-1
    autocmd FileType c,cpp,h,hpp nnoremap <buffer><Leader>xc :.-1,.+1ClangFormat<CR> zz
    " if you install vim-operator-user
    autocmd FileType c,cpp,h,hpp map <buffer><Leader>xl <Plug>(operator-clang-format)
    autocmd Filetype c,cpp,h,hpp call ClangFormatFunc()
    autocmd FileType c,cpp,cc,h,hpp,hh setlocal cindent comments=sr:/*,mb:*,el:*/,:// cino=)20,*30,g0
    autocmd BufNewFile *.{h,hpp} call s:insert_gates()
    autocmd BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp setlocal
                \ noexpandtab
                \ tabstop=4
                \ shiftwidth=4
                \ softtabstop=4
                \ textwidth=80
                \ expandtab
                \ autoindent
                \ fileformat=unix
                \ number
augroup END


" autocommands to setup settings for different file types
augroup fswitch
    autocmd!
    autocmd! BufEnter,BufRead *.h call AppendCreate('b:fswitchdst', '"c"')
                              \ | call AppendCreate('b:fswitchdst', '"cc"')
                              \ | call AppendCreate('b:fswitchdst', '"cpp"')
                              \ | call AppendCreate('b:fswitchlocs', '"."')
    autocmd! BufEnter,BufRead *.c,*.cc let b:fswitchdst = 'h'
                                   \ | let b:fswitchlocs = '.'
    autocmd! BufEnter,BufRead *.hpp let b:fswitchdst = 'cpp'
                                \ | let b:fswitchlocs = '.'
    autocmd! BufEnter,BufRead *.cpp let b:fswitchdst = 'hpp,h'
                                \ | let b:fswitchlocs = '.,../include'
    autocmd! BufEnter,BufRead *.xaml let b:fswitchdst = 'xaml.cs'
                                 \ | let b:fswitchlocs = '.'
    autocmd! BufEnter,BufRead *.xaml.cs let b:fswitchdst = 'xaml'
                                    \ | let b:fswitchfnames = '/\.xaml//'
                                    \ | let b:fswitchlocs = '.'
augroup end

