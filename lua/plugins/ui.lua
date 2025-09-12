return {
    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                vim.o.statusline = " "
            else
                vim.o.laststatus = 0
            end
        end,
        opts = function()
            local lualine_require = require("lualine_require")
            lualine_require.require = require

            vim.o.laststatus = vim.g.lualine_laststatus

            local opts = {
                options = {
                    theme = "auto",
                    globalstatus = vim.o.laststatus == 3,
                    disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },

                    lualine_c = {
                        {
                            "diagnostics",
                            symbols = {
                                error = "✘ ",
                                warn = "▲ ",
                                info = "» ",
                                hint = "⚑ ",
                            },
                        },
                        {
                            "filetype",
                            icon_only = true,
                            separator = "",
                            padding = { left = 1, right = 0 },
                        },
                        { "filename", symbols = { modified = "  ", readonly = "", unnamed = "" } },
                    },
                    lualine_x = {
                        {
                            function()
                                return require("noice").api.status.command.get()
                            end,
                            cond = function()
                                return package.loaded["noice"]
                                    and require("noice").api.status.command.has()
                            end,
                            color = function()
                                return { fg = "#ff9e64" }
                            end,
                        },
                        {
                            function()
                                return require("noice").api.status.mode.get()
                            end,
                            cond = function()
                                return package.loaded["noice"]
                                    and require("noice").api.status.mode.has()
                            end,
                            color = function()
                                return { fg = "#ff9e64" }
                            end,
                        },
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                            color = function()
                                return { fg = "#ff9e64" }
                            end,
                        },
                        {
                            "diff",
                            symbols = {
                                added = " ",
                                modified = " ",
                                removed = " ",
                            },
                            source = function()
                                local gitsigns = vim.b.gitsigns_status_dict
                                if gitsigns then
                                    return {
                                        added = gitsigns.added,
                                        modified = gitsigns.changed,
                                        removed = gitsigns.removed,
                                    }
                                end
                            end,
                        },
                    },
                    lualine_y = {
                        {
                            "progress",
                            separator = " ",
                            padding = { left = 1, right = 0 },
                        },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
                extensions = { "nvim-tree", "lazy" },
            }

            return opts
        end,
    },

    -- Snacks.nvim - comprehensive QoL plugin collection
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            -- Core UI improvements
            input = { enabled = true },
            notifier = { enabled = true },

            -- File management and navigation
            picker = {
                enabled = true,
                ui_select = true,
                win = { border = "rounded" },
            },
            explorer = { enabled = true },

            -- Visual enhancements
            indent = { enabled = true },
            scroll = { enabled = true },
            animate = { enabled = true },

            -- Buffer management
            bufdelete = { enabled = true },

            -- Additional features
            dashboard = {
                enabled = true,
                sections = {
                    { section = "header" },
                    { section = "keys" },
                    { section = "startup" },
                },
                preset = {
                    header = [[
⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷
⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇
⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽
⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕
⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕
⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕
⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄
⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕
⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿
⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟
⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠
⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙
⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣
                ]],
                },
            },
            terminal = { enabled = true },
            zen = { enabled = true },
            gitbrowse = { enabled = true },
            bigfile = { enabled = true },

            -- Words (LSP references)
            words = { enabled = true },

            -- Scope detection
            scope = { enabled = true },
        },
        keys = {
            -- File picker
            {
                "<leader>ff",
                function()
                    Snacks.picker.files()
                end,
                desc = "Find Files",
            },
            {
                "<leader>fg",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Grep Files",
            },
            {
                "<leader>fb",
                function()
                    Snacks.picker.buffers()
                end,
                desc = "Find Buffers",
            },
            {
                "<leader>fr",
                function()
                    Snacks.picker.recent()
                end,
                desc = "Recent Files",
            },
            {
                "<leader>fh",
                function()
                    Snacks.picker.help()
                end,
                desc = "Help Tags",
            },
            {
                "<leader>fc",
                function()
                    Snacks.picker.command_history()
                end,
                desc = "Command History",
            },
            {
                "<leader>fs",
                function()
                    Snacks.picker.lsp_symbols()
                end,
                desc = "LSP Symbols",
            },
            {
                "<leader>fd",
                function()
                    Snacks.picker.diagnostics()
                end,
                desc = "Diagnostics",
            },
            {
                "<leader>fn",
                function()
                    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
                end,
                desc = "Find Neovim Files",
            },

            -- Git integration
            {
                "<leader>gc",
                function()
                    Snacks.picker.git_log()
                end,
                desc = "Git Commits",
            },
            {
                "<leader>gs",
                function()
                    Snacks.picker.git_status()
                end,
                desc = "Git Status",
            },
            {
                "<leader>gb",
                function()
                    Snacks.picker.git_branches()
                end,
                desc = "Git Branches",
            },
            {
                "<leader>go",
                function()
                    Snacks.gitbrowse.open()
                end,
                desc = "Git Browse",
            },

            -- File explorer
            {
                "<leader>e",
                function()
                    Snacks.explorer()
                end,
                desc = "Toggle Explorer",
            },

            -- Terminal
            {
                "<leader>tt",
                function()
                    Snacks.terminal.toggle()
                end,
                desc = "Toggle Terminal",
            },
            {
                "<leader>tf",
                function()
                    Snacks.terminal.toggle("float")
                end,
                desc = "Float Terminal",
            },

            -- Zen mode
            {
                "<leader>uz",
                function()
                    Snacks.zen.toggle()
                end,
                desc = "Toggle Zen Mode",
            },

            -- Dashboard
            {
                "<leader>uD",
                function()
                    Snacks.dashboard.open()
                end,
                desc = "Open Dashboard",
            },

            -- Notifications
            {
                "<leader>un",
                function()
                    Snacks.notifier.hide()
                end,
                desc = "Hide Notifications",
            },
            {
                "<leader>uN",
                function()
                    Snacks.notifier.show_history()
                end,
                desc = "Show Notification History",
            },

            -- Buffer deletion
            {
                "<leader>bd",
                function()
                    Snacks.bufdelete.delete()
                end,
                desc = "Delete Buffer",
            },
            {
                "<leader>bD",
                function()
                    Snacks.bufdelete.delete({ force = true })
                end,
                desc = "Delete Buffer (Force)",
            },
            -- notifier
            {
                "<leader>n",
                function()
                    if Snacks.config.picker and Snacks.config.picker.enabled then
                        Snacks.picker.notifications()
                    else
                        Snacks.notifier.show_history()
                    end
                end,
                desc = "Notification History",
            },
            {
                "<leader>un",
                function()
                    Snacks.notifier.hide()
                end,
                desc = "Dismiss All Notifications",
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup which-key descriptions
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd
                end,
            })
        end,
    },

    -- Icons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        opts = {
            color_icons = true,
            default = true,
        },
    },

    -- Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "moon",
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")
        end,
    },

    -- Buffer line
    {
        "akinsho/bufferline.nvim",
        version = "*",
        event = "VeryLazy",
        keys = {
            { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
            {
                "<leader>bP",
                "<Cmd>BufferLineGroupClose ungrouped<CR>",
                desc = "Delete Non-Pinned Buffers",
            },
            { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
            { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
            { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
            { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
            { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
            { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
        },
        opts = {
            options = {
                close_command = function(n)
                    require("mini.bufremove").delete(n, false)
                end,
                right_mouse_command = function(n)
                    require("mini.bufremove").delete(n, false)
                end,
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                diagnostics_indicator = function(_, _, diag)
                    local icons = { Error = " ", Warn = " ", Hint = " ", Info = " " }
                    local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                        .. (diag.warning and icons.Warn .. diag.warning or "")
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = "nvim-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true,
                    },
                },
                get_element_icon = function(opts)
                    return require("nvim-web-devicons").get_icon(
                        opts.filename,
                        opts.extension,
                        { default = false }
                    )
                end,
            },
        },
        config = function(_, opts)
            require("bufferline").setup(opts)
            vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
                callback = function()
                    vim.schedule(function()
                        pcall(nvim_bufferline)
                    end)
                end,
            })
        end,
    },

    -- Which-key
    {
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
                    { "<leader>c", group = "code" },
                    { "<leader>d", group = "debug" },
                    { "<leader>f", group = "file/find/format" },
                    { "<leader>g", group = "git" },
                    { "<leader>l", group = "lua/lazy" },
                    { "<leader>m", group = "markdown" },
                    { "<leader>r", group = "rust" },
                    { "<leader>s", group = "search" },
                    { "<leader>t", group = "terminal" },
                    { "<leader>u", group = "ui" },
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
    },
}
