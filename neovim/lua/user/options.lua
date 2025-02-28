-- 基本的なエディタ設定
local opt = vim.opt

-- UI関連設定
opt.number = true           -- 行番号表示
opt.laststatus = 3          -- ステータスラインを常に表示
opt.visualbell = true       -- ビープ音の代わりに視覚表示
opt.errorbells = false      -- エラーベル無効
opt.title = false           -- タイトル表示無効
opt.wrap = false            -- 行の折り返し無効
opt.breakindent = true      -- 折り返し時にインデントを保持
opt.modeline = true         -- モードライン有効
opt.listchars = {           -- 不可視文字の表示設定
  eol = "¬",
  tab = "▸\\"
}
opt.mouse = "a"             -- マウス操作を全モードで有効化
opt.ambiwidth = "double"    -- 全角文字の幅を2に設定
opt.termguicolors = true

-- エディタの挙動設定
opt.backspace = "indent,eol,start"  -- バックスペースの挙動
opt.wildmenu = true         -- コマンドライン補完を拡張モードで

-- インデント設定
opt.shiftwidth = 4          -- インデント幅
opt.softtabstop = 4         -- ソフトタブの幅
opt.tabstop = 4             -- タブ幅
opt.expandtab = true        -- タブをスペースに展開

-- 検索設定
opt.ignorecase = true       -- 大文字小文字を区別しない
opt.smartcase = true        -- 検索パターンに大文字を含む場合は区別する

-- ファイル設定
opt.backup = false          -- バックアップファイルを作成しない
opt.swapfile = true         -- スワップファイルを作成する

-- プラットフォーム固有の設定
if vim.fn.has("unix") == 1 then
  opt.directory = "/tmp/"   -- スワップファイルのディレクトリ
  opt.undodir = "/tmp/"     -- undoファイルのディレクトリ
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  if vim.fn.isdirectory("C:/Temp") == 1 then
    opt.directory = "C://Temp"
    opt.undodir = "C://Temp"
  else
    opt.directory = vim.env.HOME
    opt.undodir = vim.env.HOME
  end
end

-- シンタックスハイライト有効化
vim.cmd('syntax enable')

local cellwidths = vim.fn.getcellwidths()

-- Unicode Standard Miscellaneous Symbols
table.insert(cellwidths, { 0x2600, 0x26ff, 1 })

-- Seti-UI + Custom
table.insert(cellwidths, { 0xe5fa, 0xe6ac, 1 })

-- Devicons
table.insert(cellwidths, { 0xe700, 0xe7c5, 1 })

-- Font Awesome
table.insert(cellwidths, { 0xf000, 0xf2e0, 1 })

-- Font Awesome Extension
table.insert(cellwidths, { 0xe200, 0xe2a9, 1 })

-- Material Design Icons
table.insert(cellwidths, { 0xf0001, 0xf1af0, 1 })

-- Weather
table.insert(cellwidths, { 0xe300, 0xe3e3, 1 })

-- Octicons
table.insert(cellwidths, { 0xf400, 0xf532, 1 })

-- Powerline Symbols
table.insert(cellwidths, { 0xe0a0, 0xe0a2, 1 })
table.insert(cellwidths, { 0xe0b0, 0xe0b3, 1 })

-- Powerline Extra Symbols
table.insert(cellwidths, { 0xe0a3, 0xe0a3, 1 })
table.insert(cellwidths, { 0xe0b4, 0xe0c8, 1 })
table.insert(cellwidths, { 0xe0ca, 0xe0ca, 1 })
table.insert(cellwidths, { 0xe0cc, 0xe0d4, 1 })

-- IEC Power Symbols
table.insert(cellwidths, { 0x23fb, 0x23fe, 1 })
table.insert(cellwidths, { 0x2b58, 0x2b58, 1 })

-- Font Logos
table.insert(cellwidths, { 0xf300, 0xf32f, 1 })

-- Pomicons
table.insert(cellwidths, { 0xe000, 0xe00a, 1 })

-- Codicons
table.insert(cellwidths, { 0xea60, 0xebeb, 1 })

-- Heavy Angle Brackets
table.insert(cellwidths, { 0x276c, 0x2771, 1 })

-- Box Drawing
table.insert(cellwidths, { 0x2500, 0x259f, 1 })

vim.fn.setcellwidths(cellwidths)

return {}  -- 空のテーブルを返し、require時にエラーが発生しないようにする
