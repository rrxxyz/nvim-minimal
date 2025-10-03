return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 200,
        expand = 1,
        notify = false,
        triggers = {
            { "<auto>", mode = "nixsotc" },
            { "s", mode = { "n", "v" } },
        },
        spec = {
            {
                mode = { "n", "v" },
                { "<leader>b", group = "buffer" },
                { "<leader>c", group = "code/C/C++" },
                { "<leader>d", group = "debug" },
                { "<leader>f", group = "file/find/format" },
                { "<leader>g", group = "git" },
                { "<leader>l", group = "lua/lazy" },
                { "<leader>m", group = "markdown" },
                { "<leader>r", group = "rust" },
                { "<leader>s", group = "search" },
                { "<leader>t", group = "terminal" },
                { "<leader>u", group = "ui" },
                { "<leader>h", group = "Harpoon" },
                { "<leader>w", group = "windows" },
                { "<leader>x", group = "diagnostics/quickfix" },
                { "<leader>o", group = "Obsidian" },
                { "[", group = "prev" },
                { "]", group = "next" },
                { "g", group = "goto" },
                { "gs", group = "surround" },
                { "z", group = "fold" },
            },
        },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
        },
        win = {
            border = "rounded",
            padding = { 1, 2 },
            wo = {
                winblend = 10,
            },
        },
        show_help = true,
        show_keys = true,
        disable = {
            bt = {},
            ft = { "TelescopePrompt" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
