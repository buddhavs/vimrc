" set leader to ,
let mapleader=","
let g:mapleader=","


set autoindent          " auto indentation
set autoread		    " auto read when file is changed from outside
set bs=2		        " allow backspacing over everything in insert mode
set copyindent          " copy the previous indentation on autoindenting
set clipboard=unnamed   " yank to the system register (*) by default
set directory=/tmp
set exrc
set foldmethod=indent
set foldlevel=99
set hidden
set history=1000
set hlsearch            " search highlighting
set incsearch           " incremental search
set ignorecase          " ignore case when searching
set nobackup            " no *~ backup files
set noswapfile
set nowritebackup
set ruler	        	" show the cursor position all the time
set secure
set showmatch           " Cursor shows matching ) and }
set showmode            " Show current mode
set smartcase           " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab            " insert tabs on the start of a line according to context
" Don't unload abandoned buffers
set undodir=~/.vim-undo
set undofile
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
set wildchar=<TAB>      " wild char completion menu
set wildmenu            " wild char completion menu


" auto reload vimrc when editing the file
" autocmd! bufwritepost .vimrc source ~/.vimrc


" auto change local windows directory to current file directory
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" autocmd BufEnter * silent! lcd %:p:h
" autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif


" g:my_vim_dir is used elsewhere in my vim configurations
let g:my_vim_dir=expand("$HOME/.vim")


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


" --- move around splits {
" move to and maximize the below split
map <c-j> <C-W>j<C-W>_
" move to and maximize the above split
map <c-k> <C-W>k<C-W>_
" move to and maximize the left split
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others
set wmh=0                     " set the min height of a window to 0 so we can maximize others

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
"go to prev tab
" nnoremap <C-t><C-n> gT
"go to next tab
" nnoremap <C-t><C-p> gt
" new tab
nnoremap <C-t><C-t> :tabnew<CR>
" close tab
nnoremap <C-t><C-w> :tabclose<CR>

" http://superuser.com/questions/410982/in-vim-how-can-i-quickly-switch-between-tabs
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Go to last active tab
let g:lasttab = 1
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ,p toggles paste mode
"set paste
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h
" nnoremap ,cd :cd %:p:h<CR>
" nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Move to next new line instead of enter insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Show line number
nnoremap <silent> <leader>N :set number!<CR>

" Show buffers
nnoremap <F5> :buffers<CR>:buffer<Space>

" Taggle Read Only
nnoremap <silent> <leader>ro :set ro!<CR>

" Show full path file name
nnoremap <C-h> :echo expand('%:p')<CR>

nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
