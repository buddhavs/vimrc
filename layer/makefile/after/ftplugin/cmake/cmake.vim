augroup CmakeSettings
    autocmd!
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal nospell
    autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim
augroup end
