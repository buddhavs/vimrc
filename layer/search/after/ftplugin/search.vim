"Auto set workdir root
function! s:setcwd()
    let cph = expand('%:p:h', 1)
    if cph =~ '^.\+://' | retu | en
    for mkr in ['.git/', '.hg/', '.svn/', '.bzr/', '_darcs/', '.vimprojects']
      let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
      if wd != '' | let &acd = 0 | brea | en
    endfo
    exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
endfunction

augroup CtrlpRelated
   autocmd!
   autocmd BufEnter * call s:setcwd()
augroup END
