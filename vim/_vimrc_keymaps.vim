" ***********************************************
" Key mapping設定
" ***********************************************

" カレンダー
nnoremap    <silent>   <C-C>  :<C-u>Calendar<CR>

inoremap    <silent>   kj   <C-u><Esc>

" 
map \ <leader>
map ¥ \

" 大文字Yで行末までヤンク
nnoremap Y y$

" ノーマルモードでEscで:noh
nnoremap <silent> <ESC><ESC> <ESC>:<C-u>noh<CR>

" Ctrl+Tabでタブ切り替え
if has("gui_running")
    nnoremap <C-Tab> gt
    nnoremap <C-S-Tab> gT
else
    nnoremap <C-1><tab> gt
endif

" vimrc系編集
nnoremap <silent> <Space>ev :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <Space>eg :<C-u>tabedit $MYGVIMRC<CR>
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>

" （入力モードで）F10で再更新
imap <silent> <F10> <Esc>:<C-u>redraw<CR>

" F10でpasteモード切り替え
set pastetoggle=<F10>

" 検索magicモード
nnoremap / /\v

" SHIFT-Tabでアンインデント
inoremap <S-Tab> <ESC><<i

" 文字数カウント
nnoremap <silent> <Space>cc :<C-u>%s/./&/g<CR>:<C-u>noh<CR>

" VimFilerExplorer の展開
if has('win32') || has('win64')
    nnoremap <F3> :<C-u>VimFilerExplorer E:\\workspace<CR>
elseif has('unix')
    nnoremap <F3> :<C-u>VimFilerExplorer ~/workspace<CR>
endif

" camelcasemotion設定
omap <silent> iw <Plug>CamelCaseMotion_iw
vmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
vmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
vmap <silent> ie <Plug>CamelCaseMotion_ie

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e

" Gitvキーバインド
function! GitvGetCurrentHash()
  return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction

augroup Gitv
  autocmd!
  autocmd FileType gitv call s:my_gitv_settings()
augroup END
function! s:my_gitv_settings()
  nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
endfunction

inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-k> <Esc>ld$a
