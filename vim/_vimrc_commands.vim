" Kwbd 
command! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn

" 全開きファイルkからサーチ
command! -nargs=1 FullSearch :vimgrep /<args>/ ./**/* | cw 


" Jqコマンド
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction



" Marked 2でプレビュー
command! Marked2 :set ft=markdown | if expand("%:p")=='' | :saveas `=tempname()` | endif | :!open -a "marked 2" "%:p"
