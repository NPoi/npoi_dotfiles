" ***********************************************
" NeoBundle.vim設定
" ***********************************************
if has('vim_starting')
    if has("unix")
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    elseif has("win32") || has("win64")
        set runtimepath+=~/vimfiles/bundle/neobundle.vim/
    endif
endif


if has("unix")
    call neobundle#begin(expand('~/.vim/bundle/'))
elseif has("win32") || has("win64")
    call neobundle#begin(expand('~/vimfiles/bundle/'))
endif


" 暗黒美夢王設定
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

if has('lua')
    NeoBundle 'Shougo/neocomplete'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
else
    NeoBundle 'Shougo/neocomplcache'
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/neossh.vim'

NeoBundle 'ujihisa/vimshell-ssh'

NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/vdbi-vim'
"NeoBundle 'itchyny/calendar.vim'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'mattn/sonictemplate-vim'

NeoBundle 'sukima/xmledit'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'

" NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'bling/vim-airline'

" Git
" ---------
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

" 整形
" ---------
NeoBundle 'Align'
NeoBundle 'SQLUtilities'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'taglist.vim'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'banyan/recognize_charcode.vim'
NeoBundle 'istepura/vim-toolbar-icons-silk'
NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
NeoBundle 'tpope/vim-surround'

" syntaxes/languages
" ---------
NeoBundle 'aohta/blockdiag.vim'
NeoBundle 'othree/html5.vim'                    " html5
NeoBundle 'vim-scripts/nginx.vim'               " nginx設定ファイル
NeoBundle 'hail2u/vim-css3-syntax'              " CSS3
NeoBundle 'rcmdnk/vim-markdown'                 " Markdown
"NeoBundle 'tpope/vim-markdown'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/mkdpreview-vim'
NeoBundle 'elzr/vim-json'                       " JSON
NeoBundle 'leafgarland/typescript-vim'          " TypeScript
NeoBundle 'kchmck/vim-coffee-script'            " CoffeeScript
NeoBundle 'tpope/vim-haml'                      " Haml
NeoBundle 'chase/vim-ansible-yaml'              " YAML for Ansible
NeoBundle 'rodjek/vim-puppet'                   " Puppet DSL
NeoBundle 'python_fold'
NeoBundle 'nvie/vim-flake8'
NeoBundleLazy 'hynek/vim-python-pep8-indent', {
            \ "autoload": {"insert": 1, "filetypes": ["python", "python3", "djangohtml"]
            \    },
            \ }
NeoBundle 'vim-scripts/VOoM'

" colorschemes
NeoBundle 'w0ng/vim-hybrid'                     " hybrid
NeoBundle 'altercation/vim-colors-solarized'    " Solarized
NeoBundle 'cocopon/iceberg.vim'                 " iceberg
NeoBundle 'vim-scripts/phd'                     " PhD
NeoBundle 'vim-scripts/summerfruit256.vim'      " summerfruit256
NeoBundle 'jonathanfilip/vim-lucius'

NeoBundle 'scrooloose/syntastic'

" その他
NeoBundle 'rbtnn/rabbit-ui.vim'
NeoBundle 'rbtnn/rabbit-ui-collection.vim'

NeoBundle 't9md/vim-choosewin'

NeoBundle 'will133/vim-dirdiff'
NeoBundle 'Glench/Vim-Jinja2-Syntax'

call neobundle#end()

filetype plugin indent on
