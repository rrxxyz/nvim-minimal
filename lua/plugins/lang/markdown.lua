return {
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        event = {
            -- Load for markdown files in both Work and Personal vaults
            "BufReadPre " .. vim.fn.expand("~") .. "/Notes/Work/*.md",
            "BufReadPre " .. vim.fn.expand("~") .. "/Notes/Personal/*.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/Notes/Work/*.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/Notes/Personal/*.md",
        },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            ui = { enabled = false },
            workspaces = {
                {
                    name = "Personal",
                    path = "~/Notes/Personal",
                },
                {
                    name = "Work",
                    path = "~/Notes/Work",
                },
            },
            completion = {
                nvim_cmp = false,
            },

            -- Templates configuration
            templates = {
                folder = "templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
            },

            -- Automatically add frontmatter with date to new notes
            note_frontmatter_func = function(note)
                local out = {
                    id = note.id,
                    aliases = note.aliases,
                    tags = note.tags,
                    date = os.date("%Y-%m-%d"),
                    created = os.date("%Y-%m-%d %H:%M"),
                }
                -- Preserve existing frontmatter if note has it
                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end
                return out
            end,

            picker = {
                name = "telescope.nvim",
                -- Optional, configure key mappings for the picker. These are the defaults.
                -- Not all pickers support all mappings.
                note_mappings = {
                    -- Create a new note from your query.
                    new = "<C-n>",
                    -- Insert a link to the selected note.
                    insert_link = "<C-l>",
                },
                tag_mappings = {
                    -- Add tag(s) to current note.
                    tag_note = "<C-n>",
                    -- Insert a tag at the current location.
                    insert_tag = "<C-l>",
                },
            },
            mappings = {
                -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
                ["gf"] = {
                    action = function()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = {
                        noremap = false,
                        expr = true,
                        buffer = true,
                        desc = "Obsidian  go to gf_passthrough",
                    },
                },
                -- Toggle check-boxes.
                ["<leader>oc"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true, desc = "Toggle Checkbox" },
                },
                -- Smart action depending on context, either follow link or toggle checkbox.
                ["<cr>"] = {
                    action = function()
                        return require("obsidian").util.smart_action()
                    end,
                    opts = { buffer = true, expr = true },
                },
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
            { "<leader>oe", "<cmd>ObsidianExtractNote<CR>", desc = "Extract to new note", mode = "v" },
            { "<leader>op", "<cmd>ObsidianPasteImg<CR>", desc = "Paste image" },
            { "<leader>or", "<cmd>ObsidianRename<CR>", desc = "Rename note" },
            { "<leader>of", "<cmd>ObsidianFollowLink<CR>", desc = "Follow link" },
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
}
