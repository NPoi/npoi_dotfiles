-- プラグイン設定 (lazy.nvim版)
-- 注意: 最初に lazy.nvim をインストールする必要があります
-- https://github.com/folke/lazy.nvim#-installation

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 最新の安定版を使用
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインの設定
return require("lazy").setup({
  -- 基本プラグイン
  { "koron/vim-kaoriya" },
  { "mattn/sonictemplate-vim" },
  
  -- LSP関連プラグイン
  { "prabirshrestha/vim-lsp" },
  { "mattn/vim-lsp-settings" },
  { "mattn/vim-lsp-icons" },
  
  -- Denops & DDC関連プラグイン
  { "Shougo/ddc.vim", dependencies = { "vim-denops/denops.vim" } },
  { "Shougo/pum.vim" },
  { "Shougo/ddc-around" },            -- カーソル周辺の既出単語を補完するsource
  { "LumaKernel/ddc-file" },          -- ファイル名を補完するsource
  { "Shougo/ddc-matcher_head" },      -- 入力中の単語を補完の対象にするfilter
  { "Shougo/ddc-sorter_rank" },       -- 補完候補を適切にソートするfilter
  { "Shougo/ddc-converter_remove_overlap" }, -- 補完候補の重複を防ぐためのfilter
  { "Shougo/ddc-ui-native" },
  { "shun/ddc-vim-lsp" },
  
  -- スニペット
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/vim-vsnip-integ" },
  
  -- ユーティリティ
  { "thinca/vim-quickrun" },
  { 
    "vim-airline/vim-airline",
    dependencies = { "vim-airline/vim-airline-themes" }
  },
  { "bkad/CamelCaseMotion" },
  { "tpope/vim-surround" },
  { "fatih/vim-go", ft = "go" },  -- Goファイルの時だけ読み込む
  
  -- DDU関連プラグイン
  require("user.plugins.ddu"),
  
  -- その他のユーティリティ
  { "vim-voom/VOoM" },
  { "Yggdroot/indentLine" },
  { "will133/vim-dirdiff" },
  { "banyan/recognize_charcode.vim" },
  { "t9md/vim-choosewin" },
  { "hashivim/vim-terraform", ft = "terraform" },
  { "github/copilot.vim" },
  require("user.plugins.avante"),
  
  -- カラースキーム
  { "w0ng/vim-hybrid" },
  { "altercation/vim-colors-solarized" },
  { "cocopon/iceberg.vim" },
  { "vim-scripts/phd" },
  { "vim-scripts/summerfruit256.vim" },
  { "jonathanfilip/vim-lucius" }
})
