return {
    {
        "rrxxyz/droid-nvim",
        lazy = false, -- Load immediately
        opts = {
            android = {
                -- qt_qpa_platform = "xcb", -- or "wayland", "offscreen"
            },
        },
        ft = { "kotlin", "java", "gradle" }, -- Load only for Android-related files
        keys = {
            { "<leader>ar", "<cmd>DroidRun<cr>", desc = "Android: Build and Run" },
            { "<leader>ac", "<cmd>DroidClean<cr>", desc = "Android: Clean Project" },
            { "<leader>as", "<cmd>DroidSync<cr>", desc = "Android: Sync Dependencies" },
            { "<leader>al", "<cmd>DroidLogcat<cr>", desc = "Android: Show Logcat" },
            { "<leader>aL", "<cmd>DroidLogcatStop<cr>", desc = "Android: Stop Logcat" },
            {
                "<leader>aA",
                "<cmd>DroidLogcatToggleAutoScroll<cr>",
                desc = "Android: Toggle Logcat Auto-scroll",
            },
            {
                "<leader>ag",
                "<cmd>DroidGradleLog<cr>",
                desc = "Android: Show Gradle Log",
            },
            { "<leader>aG", "<cmd>DroidGradleStop<cr>", desc = "Android: Stop Gradle" },
            {
                "<leader>aE",
                "<cmd>DroidEmulatorStop<cr>",
                desc = "Android: Stop Emulator",
            },
            {
                "<leader>aW",
                "<cmd>DroidEmulatorWipeData<cr>",
                desc = "Android: Wipe Emulator Data",
            },
            {
                "<leader>at",
                function()
                    vim.ui.input({ prompt = "Gradle task: " }, function(task)
                        if task and task ~= "" then
                            vim.cmd("DroidTask " .. task)
                        end
                    end)
                end,
                desc = "Android: Run Custom Gradle Task",
            },
            -- Logcat filtering shortcuts
            {
                "<leader>lf",
                function()
                    vim.ui.input({ prompt = "Filter (key=value): " }, function(filter)
                        if filter and filter ~= "" then
                            vim.cmd("DroidLogcatFilter " .. filter)
                        end
                    end)
                end,
                desc = "Android: Custom Logcat Filter",
            },
            {
                "<leader>lm",
                "<cmd>DroidLogcatFilter package=mine<cr>",
                desc = "Android: Filter My Package",
            },
            {
                "<leader>ln",
                "<cmd>DroidLogcatFilter package=none<cr>",
                desc = "Android: No Package Filter (All Logs)",
            },
            {
                "<leader>le",
                "<cmd>DroidLogcatFilter log_level=e<cr>",
                desc = "Android: Filter Errors Only",
            },
            {
                "<leader>lw",
                "<cmd>DroidLogcatFilter log_level=w<cr>",
                desc = "Android: Filter Warnings+",
            },
        },
    },
}
