-- 基本的なエディタ設定
local opt = vim.opt

-- UI関連設定
opt.number = true           -- 行番号表示
opt.laststatus = 2          -- ステータスラインを常に表示
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

return {}  -- 空のテーブルを返し、require時にエラーが発生しないようにする
