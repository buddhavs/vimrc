au FileType Makefile set noexpandtab

augroup CmakeRelated
    autocmd!
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal nospell
    autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in runtime! indent/cmake.vim
    autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt,*.cmake.in setf cmake
    autocmd BufRead,BufNewFile *.ctest,*.ctest.in setf cmake
augroup END
