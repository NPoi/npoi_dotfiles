-- カスタムコマンドの設定

-- Kwbd コマンド - バッファを閉じてもウィンドウを閉じない
vim.api.nvim_create_user_command('Kwbd', function()
  local current_buf = vim.api.nvim_get_current_buf()
  vim.cmd('enew')
  vim.cmd('bdelete ' .. current_buf)
end, {})

-- 全ファイルからの検索コマンド
vim.api.nvim_create_user_command('FullSearch', function(opts)
  vim.cmd('vimgrep /' .. opts.args .. '/ ./**/*')
  vim.cmd('cw')  -- Quickfixウィンドウを開く
end, { nargs = 1 })

-- Jqコマンド - JSONの整形
vim.api.nvim_create_user_command('Jq', function(opts)
  local arg = "."
  if opts.args ~= "" then
    arg = opts.args
  end
  vim.cmd('%! jq "' .. arg .. '"')
end, { nargs = '?' })

-- Marked 2でプレビュー（Mac固有コマンド）
if vim.fn.has('mac') == 1 then
  vim.api.nvim_create_user_command('Marked2', function()
    vim.cmd('set ft=markdown')
    if vim.fn.expand('%:p') == '' then
      vim.cmd('saveas ' .. vim.fn.tempname())
    end
    vim.cmd('!open -a "Marked 2" "%:p"')
  end, {})
end

return {}  -- 空のテーブルを返し、require時にエラーが発生しないようにする
