" Persist undo history.
if !isdirectory($HOME . "/.vim-undo")
  call mkdir($HOME . "/.vim-undo", "", 0700)
endif


function! ResCur()
  if line("'\"") <= line("$") && !&diff
    normal! g`"
    return 1
  endif
endfunction


augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" Allow saving as root
command! Wsudo w !sudo tee % > /dev/null


" Common typos
command! W w
command! Wa wa
command! Wq wq
command! Wqa wqa


" Make the proper directories when writing a file
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction


augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
