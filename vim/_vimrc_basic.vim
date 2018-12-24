" 基本設定
set number
set modeline
set laststatus=2
set ignorecase
set smartcase
set wildmenu
set backspace=indent,eol,start
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set nowrap
set ambiwidth=double
set mouse=a
set notitle
set vb t_vb=

set breakindent

set listchars=eol:¬,tab:▸\

set nobackup
set swapfile

set noshellslash

if has("unix")
    set directory=/tmp/
    set undodir=/tmp/
elseif has("win32") || has("win64") 
    if isdirectory("C:/Temp")
        set directory=C://Temp
        set undodir=C://Temp
    else
        set directory=$HOME
        set undodir=$HOME
    endif
endif

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

syntax enable

