-- ~/.config/nvim/lua/plugins/editor.lua
return {
    -- Autoformat
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function ()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    python = { "isort", "black" },
                    -- Conform will run the first available formatter
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            })
        end
    },
    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        keys = {
            { "<leader>ee", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
            { "\\", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle file explorer on current file" },
            { "<leader>ec", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse file explorer" },
            { "<leader>er", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh file explorer" },
        },
        config = function()
            -- Disable netrw
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({
                view = {
                    width = 35,
                    relativenumber = true,
                },
                renderer = {
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                        glyphs = {
                            folder = {
                                arrow_closed = "",
                                arrow_open = "",
                            },
                        },
                    },
                },
                actions = {
                    open_file = {
                        window_picker = {
                            enable = false,
                        },
                    },
                },
                filters = {
                    custom = { ".DS_Store" },
                },
                git = {
                    ignore = false,
                },
            })
        end,
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
            { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
            { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Show open buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Show available help tags" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    path_display = { "truncate" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                    file_ignore_patterns = {
                        "node_modules/",
                        ".git/",
                        "__pycache__/",
                        "*.pyc",
                        ".pytest_cache/",
                        "build/",
                        "dist/",
                        "*.egg-info/",
                    },
                },
            })
        end,
    },

    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "python",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "markdown",
                    "markdown_inline",
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
            })
        end,
    },
    -- Undotree
    { "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = { -- load the plugin only when using it's keybinding:
            { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
        },
    }
}
