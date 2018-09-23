" Enable global syntax highlighting
" syntax on

" Highlight boundary
" Show overlength line in different color.
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
match OverLength /\%81v.\+/


" --- Highlight unwanted trail spaces in color Red
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/

" augroup TrailSpaceRelated
    " autocmd!
    " autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    " autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    " autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    " autocmd BufWinLeave * call clearmatches()
" augroup END


" Color conceal characters nicely
hi Conceal guifg=green ctermfg=green
set conceallevel=2


" Rainbow operators
let g:rainbow_active = 1
let g:rainbow_conf =
\ {
\  'guifgs': ['darkorange3', 'seagreen3', 'deepskyblue', 'darkorchid3', 'forestgreen', 'lightblue', 'hotpink', 'mistyrose1'],
\  'ctermfgs': ['darkgreen', 'cyan', 'lightgreen', 'lightred'],
\  'operators': '_[\,\+\*\-\&\^\!\.\<\>\=\|\?]_',
\  'parentheses':
\  [
\    'start=/(/ end=/)/ fold',
\    'start=/\[/ end=/\]/ fold',
\    'start=/{/ end=/}/ fold'
\  ],
\  'separately':
\  {
\    'jank':
\    {
\      'parentheses':
\      [
\        'start=/(\ze[^;]/ end=/)/ fold',
\        'start=/\[/ end=/\]/ fold',
\        'start=/{/ end=/}/ fold'
\      ],
\    },
\  }
\}


" Add a hook to patch the colorscheme
function! FixColorscheme()
  hi Pmenu guibg=#eee8d5 guifg=#586e75 gui=none
  hi PmenuSel guibg=#859900 guifg=#586e75 gui=none
endfunction


augroup fix_colorscheme
  au!
  au ColorScheme * call FixColorscheme()
augroup END


" Set colorscheme and trigger hook
set background=dark
set cursorline        " highlight current line
set t_Co=256          " 256 color mode


" Modify theme color basic
hi Visual ctermbg=018 guibg=#003853
hi CursorLine guibg=#003853 ctermbg=273 gui=none cterm=none


let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
" colorscheme zenburn
