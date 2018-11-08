" set diffopt+=internal,algorithm:patience

" started In Diff-Mode set diffexpr (plugin not loaded yet)
" if &diff
    " let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
" endif

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
