" ,g generates the header guard
map <leader>g :call IncludeGuard()<CR>
" ,c generates the copyleft info for c/c++
map <leader>gc :call IncludeCR(0)<CR>
" ,cm generates the copyleft info for cmake
map <leader>gm :call IncludeCR(1)<CR>

fun! IncludeGuard()
   call IncludeCR(0)
   call append(4, "#pragma once")
   " let basename = substitute(bufname(""), '.*/', '', '')
   " let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   " call append(3, "")
   " call append(4, "#ifndef " . guard)
   " call append(5, "#define " . guard)
   " call append( line("$"), "#endif // for #ifndef " . guard)
endfun

fun! IncludeCR(type)
   if a:type == 0
      let l:guard0 = '/* ******************************'
      let l:guard1 = ' * Copyleft 2018 Verbalsaint'
      let l:guard2 = ' * ******************************/'
   elseif a:type == 1
      let l:guard0 = '# ******************************'
      let l:guard1 = '# Copyleft 2018 Verbalsaint'
      let l:guard2 = '# ******************************'
   endif
   call append(0, guard0)
   call append(1, guard1)
   call append(2, guard2)
endfun

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


nnoremap <leader>tb :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1


hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment


let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail', 'tweetvim']


map <unique> <Leader>tl <Plug>TaskList
