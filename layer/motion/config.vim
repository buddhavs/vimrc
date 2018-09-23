" Number formats, for incrementing
set nrformats=octal,hex

" Use a short timeout for incomplete mappings
set ttimeout
set ttimeoutlen=100

" Highlight the current line
set cursorline

" Go to file in a new tab
nnoremap gF <C-W>gF

" Delete lines without adding them to the yank stack
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Paste from the yank buffer
nnoremap <leader>p "0p
vnoremap <leader>p "0p
nnoremap <leader>P "0P
vnoremap <leader>P "0P

nnoremap Y y$

" Delete comment character(s) when joining commented lines
set formatoptions+=j

" Move based on display lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Try not to use escape, duh~~
inoremap jk <Esc>
inoremap kj <Esc>

call camelcasemotion#CreateMotionMappings('<leader>')
