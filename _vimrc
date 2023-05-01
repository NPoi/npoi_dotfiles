" ***********************************************
"  .vimrc
" ***********************************************
set term=builtin_xterm

source $HOME/.vim/vimrc_kaoriya.vim

" Vim Basic設定
source $HOME/npoi_dotfiles/vim/_vimrc_basic.vim

" jetpack.vim設定
source $HOME/npoi_dotfiles/vim/_vimrc_jetpack.vim

" LSP
source $HOME/npoi_dotfiles/vim/_vimrc_lsp.vim

" オリジナルコマンド系
source $HOME/npoi_dotfiles/vim/_vimrc_commands.vim

" キーマップ設定
source $HOME/npoi_dotfiles/vim/_vimrc_keymaps.vim

" カラー関係
set background=dark
set t_Co=256


" SonicTemplate設定
if has("unix")
    let g:sonictemplate_vim_template_dir = [
      \ '$HOME/.vim/template'
      \]
elseif has("win32") || has("win64")
    let g:sonictemplate_vim_template_dir = '~/vimfiles/template/'
endif


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
au QuickfixCmdPost make,grep,grepadd,vimgrep copen
set backupskip=/tmp/*,/private/tmp/*
scriptencoding utf-8


call ddu#custom#patch_global({
    \   'ui': 'filer',
    \   'sources': [{'name': 'file', 'params': {}}],
    \   'sourceOptions': {
    \     '_': {
    \       'columns': ['filename'],
    \     },
    \   },
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     },
    \   }
    \ })
