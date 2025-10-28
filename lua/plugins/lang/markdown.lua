return {
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Only load obsidian.nvim for markdown files in your vaults
        event = {
            "BufReadPre " .. vim.fn.expand("~") .. "/Notes/Vaults/**.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/Notes/Vaults/**.md",
        },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            dir = "~/Notes/Vaults",
            picker = {
                name = "telescope.nvim",
            },
            ui = {
                enable = false,
            },
        },
        keys = {
            { "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "Open note" },
            { "<leader>on", "<cmd>ObsidianNew<CR>", desc = "New note" },
            { "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search notes" },
            { "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick switch" },
            { "<leader>og", "<cmd>ObsidianTags<CR>", desc = "Search tags" },
            { "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "Show links" },
            { "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Show backlinks" },
            { "<leader>ow", "<cmd>ObsidianWorkspace<CR>", desc = "Switch workspace" },
            { "<leader>od", "<cmd>ObsidianToday<CR>", desc = "Open today's note" },
            { "<leader>oy", "<cmd>ObsidianYesterday<CR>", desc = "Open yesterday's note" },
            { "<leader>ot", "<cmd>ObsidianTemplate<CR>", desc = "Insert template" },
            {
                "<leader>oe",
                "<cmd>ObsidianExtractNote<CR>",
                desc = "Extract to new note",
                mode = "v",
            },
            { "<leader>op", "<cmd>ObsidianPasteImg<CR>", desc = "Paste image" },
            { "<leader>or", "<cmd>ObsidianRename<CR>", desc = "Rename note" },
            { "<leader>of", "<cmd>ObsidianFollowLink<CR", desc = "Follow link" },
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            enabled = true,
            completions = {
                blink = { enabled = true },
                lsp = { enabled = true },
            },
        },
    },
}
