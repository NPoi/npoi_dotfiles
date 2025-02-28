-- DDU関連のプラグイン設定

return {
  {
    "Shougo/ddu.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddu-source-file",
      "Shougo/ddu-kind-file",
      "Shougo/ddu-column-filename",
      "Shougo/ddu-ui-filer",
    },
    config = function()
      -- ddu-ui-filerのローカル設定
      vim.fn['ddu#custom#patch_local']('filer', {
        ui = 'filer',
        sources = {
          {
            name = 'file',
            params = {},
          },
        },
        sourceOptions = {
          ['_'] = {
            columns = {'filename'},
          },
        },
        kindOptions = {
          file = {
            defaultAction = 'open',
          },
        },
        uiParams = {
          filer = {
            winWidth = 40,
            split = 'vertical',
            splitDirection = 'topleft',
          }
        },
      })

      -- ddu filerの自動更新設定
      local ddu_group = vim.api.nvim_create_augroup('ddu_filer_settings', { clear = true })

      -- ddu-filerバッファ内でのみ自動更新を行う
      vim.api.nvim_create_autocmd({'TabEnter', 'CursorHold', 'FocusGained'}, {
        group = ddu_group,
        pattern = 'ddu-filer',
        callback = function()
          if vim.fn.exists('*ddu#ui#filer#do_action') == 1 then
            vim.fn['ddu#ui#filer#do_action']('checkItems')
          end
        end,
      })

      -- ddu-filerのファイルタイプ設定
      vim.api.nvim_create_autocmd('FileType', {
        group = ddu_group,
        pattern = 'ddu-filer',
        callback = function()
          -- CRキー - ツリーの場合は展開、ファイルの場合は垂直分割で開く
          vim.keymap.set('n', '<CR>', function()
            local item = vim.fn['ddu#ui#get_item']()
            if item.isTree then
              vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'narrow'})
            else
              vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'open', params = {command = 'vsplit'}})
            end
          end, { buffer = true, silent = true })
          
          -- Spaceキー - ツリーの場合は展開、ファイルの場合は水平分割で開く
          vim.keymap.set('n', '<Space>', function()
            local item = vim.fn['ddu#ui#get_item']()
            if item.isTree then
              vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'narrow'})
            else
              vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'open', params = {command = 'split'}})
            end
          end, { buffer = true, silent = true })
          
          -- Escキー - 終了
          vim.keymap.set('n', '<Esc>', function()
            vim.fn['ddu#ui#filer#do_action']('quit')
          end, { buffer = true, silent = true })
          
          -- qキー - 終了
          vim.keymap.set('n', 'q', function()
            vim.fn['ddu#ui#filer#do_action']('quit')
          end, { buffer = true, silent = true })
          
          -- ..キー - 親ディレクトリに移動
          vim.keymap.set('n', '..', function()
            vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'narrow', params = {path = '..'}})
          end, { buffer = true, silent = true })
          
          -- cキー - コピー
          vim.keymap.set('n', 'c', function()
            vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'copy'})
          end, { buffer = true, silent = true })
          
          -- pキー - ペースト
          vim.keymap.set('n', 'p', function()
            vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'paste'})
          end, { buffer = true, silent = true })
          
          -- dキー - 削除
          vim.keymap.set('n', 'd', function()
            vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'delete'})
          end, { buffer = true, silent = true })
          
          -- rキー - リネーム
          vim.keymap.set('n', 'r', function()
            vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'rename'})
          end, { buffer = true, silent = true })
          
          -- mvキー - 移動
          vim.keymap.set('n', 'mv', function()
            vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'move'})
          end, { buffer = true, silent = true })
          
          -- tキー - 新規ファイル
          vim.keymap.set('n', 't', function()
            vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'newFile'})
          end, { buffer = true, silent = true })
          
          -- mkキー - 新規ディレクトリ
          vim.keymap.set('n', 'mk', function()
            vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'newDirectory'})
          end, { buffer = true, silent = true })
          
          -- yyキー - ヤンク
          vim.keymap.set('n', 'yy', function()
            vim.fn['ddu#ui#filer#do_action']('itemAction', {name = 'yank'})
          end, { buffer = true, silent = true })
        end,
      })

      -- ;dキーでdduを起動
      vim.keymap.set('n', ';d', function()
        vim.fn['ddu#start']({
          name = 'filer',
          searchPath = vim.fn.expand('%:p'),
        })
      end, { silent = true })
    end
  }
}
