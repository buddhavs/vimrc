let g:go_addtags_transform = "camelcase"
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_def_mode = 'guru'
let g:go_def_reuse_buffer = 1
let g:go_doc_command = ["godoc"]
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_types = 1
let g:go_info_mode = 'guru'
" https://superuser.com/questions/775723/cw-command-in-vim-how-to-avoid-auto-jumping-to-first-error
let g:go_jump_to_error = 1
let g:go_list_autoclose = 1
" https://stackoverflow.com/questions/20933836/what-is-the-difference-between-location-list-and-quickfix-list-in-vim
" let g:go_list_type = "locationlist"
let g:go_list_type = "quickfix"
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['golint']
let g:go_metalinter_deadline = "15s"
let g:go_updatetime = 3000


" https://github.com/nsf/gocode needed.
" Plug 'prabirshrestha/asyncomplete.vim' from 'cpp' directory is needed.
call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
    \ 'name': 'gocode',
    \ 'whitelist': ['go'],
    \ 'completor': function('asyncomplete#sources#gocode#completor')}))
