aug SetTabOptions
    set expandtab        "replace <TAB> with spaces
    set softtabstop=4
    set shiftwidth=4
    set tabstop=4
aug end

aug SetGlobalOptions
    set autoread		    " auto read when file is changed from outside
    set copyindent          " copy the previous indentation on autoindenting
    set clipboard=unnamed   " yank to the system register (*) by default
    set directory=/tmp
    set foldmethod=indent
    set foldlevel=99
    set history=1000
    set hlsearch            " search highlighting
    set incsearch           " incremental search
    set ignorecase          " ignore case when searching
    set nobackup            " no *~ backup files

    " disable sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=

    set noswapfile
    set nowritebackup
    set ruler	        	" show the cursor position all the time
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
    " ignore these files while expanding wild chars
    set wildignore=*.o,*.class,*.pyc,*.out,*.so,*.swp,*.zip
    set wildmenu            " wild char completion menu

    " GUI
    set tm=500
    set wmw=0                     " set the min width of a window to 0 so we can maximize others
    set wmh=0                     " set the min height of a window to 0 so we can maximize others
aug end

" g:my_vim_dir is used elsewhere in my vim configurations
let g:my_vim_dir=expand("$HOME/.vim")
