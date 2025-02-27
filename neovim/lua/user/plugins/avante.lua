-- Avante.nvimのプラグイン設定

return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
        opts = {
            -- add any opts here
            provider = "claude",
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-7-sonnet-20250219",
                temperature = 0,
                max_tokens = 4096,
            },
            keymaps = {
                apply_action = "a",  -- 'a'キーでアクションを適用
                cancel = "q",        -- 'q'キーでキャンセル
                toggle_diff = "d",   -- 'd'キーで差分表示の切り替え
                toggle_preview = "p", -- 'p'キーでプレビューの切り替え
            },
            ui = {
                width = 0.8,         -- UIの幅（画面の80%）
                height = 0.8,        -- UIの高さ（画面の80%）
                border = "rounded",  -- 角丸のボーダー
                title = "Avante",    -- UIのタイトル
            },
            code_action = {
                auto_preview = true, -- コードアクションの自動プレビュー
            },
            file_selector = {
                provider = "telescope", -- ファイル選択にTelescopeを使用
            },


        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "echasnovski/mini.pick", -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
}
