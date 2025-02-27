-- ***********************************************
-- Key mapping設定
-- ***********************************************

-- 基本的なマッピングのヘルパー関数
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- leaderキーの設定
vim.g.mapleader = '\\'
map('', '¥', '\\')

-- expand-regionプラグイン
map('v', 'v', '<Plug>(expand_region_expand)', { noremap = false })
map('v', '<C-v>', '<Plug>(expand_region_shrink)', { noremap = false })

-- 大文字Yで行末までヤンク
map('n', 'Y', 'y$')

-- ノーマルモードでEscで:noh
map('n', '<ESC><ESC>', '<ESC>:<C-u>noh<CR>')

-- Ctrl+Tabでタブ切り替え
if vim.fn.has("gui_running") == 1 then
  map('n', '<C-Tab>', 'gt')
  map('n', '<C-S-Tab>', 'gT')
else
  -- ターミナルでのタブ切り替え
  map('n', '<leader>tn', 'gt')  -- 次のタブへ
  map('n', '<leader>tp', 'gT')  -- 前のタブへ
end

-- vimrc系編集
map('n', '<Space>ev', ':<C-u>tabedit $MYVIMRC<CR>')
map('n', '<Space>eg', ':<C-u>tabedit $MYGVIMRC<CR>')
map('n', '<Space>rv', ':<C-u>source $MYVIMRC<CR>')

-- （入力モードで）F10で再更新
map('i', '<F10>', '<Esc>:<C-u>redraw<CR>')

-- F10でpasteモード切り替え
-- vim.opt.pastetoggle = '<F10>'

-- 検索magicモード
map('n', '/', '/\\v')

-- SHIFT-Tabでアンインデント
map('i', '<S-Tab>', '<ESC><<i')

-- 文字数カウント
map('n', '<Space>cc', ':<C-u>%s/./&/g<CR>:<C-u>noh<CR>')

-- camelcasemotion設定
map('o', 'iw', '<Plug>CamelCaseMotion_iw', { noremap = false })
map('v', 'iw', '<Plug>CamelCaseMotion_iw', { noremap = false })
map('o', 'ib', '<Plug>CamelCaseMotion_ib', { noremap = false })
map('v', 'ib', '<Plug>CamelCaseMotion_ib', { noremap = false })
map('o', 'ie', '<Plug>CamelCaseMotion_ie', { noremap = false })
map('v', 'ie', '<Plug>CamelCaseMotion_ie', { noremap = false })

map('', 'w', '<Plug>CamelCaseMotion_w', { noremap = false })
map('', 'b', '<Plug>CamelCaseMotion_b', { noremap = false })
map('', 'e', '<Plug>CamelCaseMotion_e', { noremap = false })
