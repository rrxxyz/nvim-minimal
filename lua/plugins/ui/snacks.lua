return {
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
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep Files" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
        { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Tags" },
        { "<leader>fc", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        {
            "<leader>fn",
            function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
            desc = "Find Neovim Files",
        },

        -- Git integration
        { "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git Commits" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>go", function() Snacks.gitbrowse.open() end, desc = "Git Browse" },

        -- File explorer
        { "<leader>e", function() Snacks.explorer() end, desc = "Toggle Explorer" },

        -- Terminal
        { "<leader>tt", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" },
        { "<leader>tf", function() Snacks.terminal.toggle("float") end, desc = "Float Terminal" },

        -- Zen mode
        { "<leader>uz", function() Snacks.zen.toggle() end, desc = "Toggle Zen Mode" },

        -- Dashboard
        { "<leader>uD", function() Snacks.dashboard.open() end, desc = "Open Dashboard" },

        -- Notifications
        { "<leader>un", function() Snacks.notifier.hide() end, desc = "Hide Notifications" },
        { "<leader>uN", function() Snacks.notifier.show_history() end, desc = "Show Notification History" },

        -- Buffer deletion
        { "<leader>bd", function() Snacks.bufdelete.delete() end, desc = "Delete Buffer" },
        { "<leader>bD", function() Snacks.bufdelete.delete({ force = true }) end, desc = "Delete Buffer (Force)" },

        -- Notifier
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
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
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
}
