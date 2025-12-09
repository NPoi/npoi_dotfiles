-- ClaudeCode.nvimのプラグイン設定

return {
    "coder/claudecode.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/snacks.nvim",
    },
    opts = {
        terminal_cmd = "~/.claude/local/claude", -- Point to local installation
        terminal = {
            provider = "native",
        },
    },
    keys = {
        { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
        { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
        { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    },
}
