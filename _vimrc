" ***********************************************
"  .vimrc
" ***********************************************

filetype plugin indent off

" Vim Basic設定
source $HOME/npoi_dotfiles/vim/_vimrc_basic.vim

" neobundle.vim設定
source $HOME/npoi_dotfiles/vim/_vimrc_neobundle.vim

call singleton#enable()

" 補完設定
source $HOME/npoi_dotfiles/vim/_vimrc_comp.vim

" オリジナルコマンド系
source $HOME/npoi_dotfiles/vim/_vimrc_commands.vim

" キーマップ設定
source $HOME/npoi_dotfiles/vim/_vimrc_keymaps.vim

" カラー関係
set background=dark
set t_Co=256


if has('win64')
  let g:vimproc_dll_path = $HOME . '\vimfiles\bundle\vimproc.vim\autoload\vimproc_win64.dll'
endif


let Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" SonicTemplate設定
if has("unix")
    let g:sonictemplate_vim_template_dir = [
      \ '$HOME/.vim/template',
      \ '$HOME/npoi_dotfiles/vim/templates'
      \]
elseif has("win32") || has("win64")
    let g:sonictemplate_vim_template_dir = '~/vimfiles/template/'
endif

" VimFiler設定
let g:vimfiler_as_default_explorer = 1


" 再読み込み時設定
augroup VimrcRewriteLoad
    autocmd!
augroup END

if !has('gui_running') && !has('win32') && !has('win64')
    " .vimrcの再読込時にも色が変化するようにする
    autocmd VimrcRewriteLoad BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .gvimrcの再読込時にも色が変化するようにする
    autocmd VimrcRewriteLoad BufWritePost $MYVIMRC source $MYVIMRC | 
                \if has('gui_running') | source $MYGVIMRC  
    autocmd VimrcRewriteLoad BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif

" QuickRun
if !exists('b:quickrun_config')
  let g:quickrun_config = {}
endif

let g:quickrun_config["markdown"] = {
            \ 'outputter' : 'null',
            \ 'command'   : 'open',
            \ 'cmdopt'    : '-a',
            \ 'args'      : 'Marked\ 2',
            \ 'exec'      : '%c %o %a %s',
            \   }

let g:quickrun_config["html"] = {
            \     'command': 'open',
            \   }

" quote syntax in markdown
"
" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_override_foldtext = 0

let g:markdown_quote_syntax_filetypes = {
        \ "sh" : {
        \   "start" : "\\%(bash\\|sh\\)",
        \},
        \ "python" : {
        \   "start" : "python",
        \},
  \}

" nginx
autocmd BufNewFile,BufRead */nginx/*.conf set ft=nginx

au QuickfixCmdPost make,grep,grepadd,vimgrep copen

" VimShell関係
let g:vimshell_right_prompt='Git_branch()'

function! Git_branch()
    let s:branch = substitute(system("git symbolic-ref --short HEAD 2> /dev/null"), '\n', '', 'g')

    if s:branch == '' || s:branch == 'HEAD'
        return ''
    else
        return '[' . s:branch . ']'
    endif
endfunction


" syntastic
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args="--max-line-length=120"

set backupskip=/tmp/*,/private/tmp/*

scriptencoding utf-8

let g:jedi#auto_initialization = 1
let g:jedi#rename_command = "<leader>R"
let g:jedi#popup_on_dot = 1
autocmd FileType python let b:did_ftplugin = 1
