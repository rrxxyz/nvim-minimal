return {
    {
        -- Use local development version
        "rrxxyz/droid-nvim",
        name = "droid.nvim",
        ft = { "kotlin", "java" }, -- Load only for Android-related files
        opts = {
            logcat = {
                window_type = "horizontal", -- "horizontal" | "vertical" | "float"
                height = 15,
                width = 100,
                filters = {
                    package = "mine",   -- "mine" (project package), specific package, or "none"
                    log_level = "v",    -- v, d, i, w, e, f (verbose shows all)
                    tag = nil,          -- specific tag to filter, or nil for no tag filtering
                    grep_pattern = nil, -- regex pattern for content filtering, or nil
                },
            },
            android = {
                auto_select_single_target = true,
                -- Qt platform for Linux compatibility
                -- qt_qpa_platform = "xcb",
                -- Optional: set custom paths if needed
                -- adb_path = "/path/to/custom/adb",
                -- emulator_path = "/path/to/custom/emulator",
            },
        },
        keys = {
            { "<leader>ar", "<cmd>DroidRun<cr>",        desc = "Android: Build and Run" },
            { "<leader>ab", "<cmd>DroidBuildDebug<cr>", desc = "Android: Build Debug" },
            { "<leader>ac", "<cmd>DroidClean<cr>",      desc = "Android: Clean Project" },
            { "<leader>as", "<cmd>DroidSync<cr>",       desc = "Android: Sync Dependencies" },
            { "<leader>ai", "<cmd>DroidInstall<cr>",    desc = "Android: Install Debug APK" },
            { "<leader>ad", "<cmd>DroidDevices<cr>",    desc = "Android: Choose Device/AVD" },
            { "<leader>ae", "<cmd>DroidEmulator<cr>",   desc = "Android: Launch Emulator" },
            {
                "<leader>aS",
                "<cmd>DroidStartEmulator<cr>",
                desc = "Android: Start Specific Emulator",
            },
            { "<leader>al", "<cmd>DroidLogcat<cr>",     desc = "Android: Show Logcat" },
            { "<leader>aL", "<cmd>DroidLogcatStop<cr>", desc = "Android: Stop Logcat" },
            {
                "<leader>aA",
                "<cmd>DroidLogcatToggleAutoScroll<cr>",
                desc = "Android: Toggle Logcat Auto-scroll",
            },
            {
                "<leader>aF",
                "<cmd>DroidLogcatFilterShow<cr>",
                desc = "Android: Show Logcat Filters",
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
                "<leader>af",
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
                "<leader>am",
                "<cmd>DroidLogcatFilter package=mine<cr>",
                desc = "Android: Filter My Package",
            },
            {
                "<leader>an",
                "<cmd>DroidLogcatFilter package=none<cr>",
                desc = "Android: No Package Filter (All Logs)",
            },
            {
                "<leader>ae",
                "<cmd>DroidLogcatFilter log_level=e<cr>",
                desc = "Android: Filter Errors Only",
            },
            {
                "<leader>aw",
                "<cmd>DroidLogcatFilter log_level=w<cr>",
                desc = "Android: Filter Warnings+",
            },
        },
    },
}
