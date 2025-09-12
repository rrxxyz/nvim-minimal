return {
    "ariedov/android-nvim",
    config = function()
        -- Specify android sdk directory
        vim.g.android_sdk = vim.fn.expand("~/Android/Sdk")
        
        require("android-nvim").setup({
            -- Explicitly set emulator path
            emulator_path = vim.fn.expand("~/Android/Sdk/emulator/emulator"),
        })
        
        -- Override the launch_avd function to fix the bug
        local function launch_avd_fixed()
            local android_sdk = vim.fn.expand(vim.fn.expand(vim.env.ANDROID_HOME or vim.g.android_sdk))
            local emulator = android_sdk .. "/emulator/emulator"

            local avds_obj = vim.system({ emulator, "-list-avds" }, {}):wait()
            if avds_obj.code ~= 0 then
                vim.notify("Cannot read emulators", vim.log.levels.WARN, {})
                return
            end

            local read = avds_obj.stdout or ""
            local avds = {}
            for line in read:gmatch("[^\r\n]+") do
                if line:match("%S") then -- Only add non-empty lines
                    table.insert(avds, line)
                end
            end
            -- Remove the buggy table.remove(avds, 1) line

            if #avds == 0 then
                vim.notify("No AVDs found", vim.log.levels.WARN, {})
                return
            end

            vim.ui.select(avds, {
                prompt = "AVD to start",
            }, function(choice)
                if choice then
                    vim.notify("Device selected: " .. choice .. ". Launching!", vim.log.levels.INFO, {})
                    vim.system({ emulator, "@" .. choice }, { text = true }, vim.schedule_wrap(function(obj)
                        if obj.code ~= 0 then
                            vim.notify("Launch failed: " .. obj.stderr, vim.log.levels.WARN, {})
                        end
                    end))
                else
                    vim.notify("Launch cancelled.", vim.log.levels.WARN, {})
                end
            end)
        end
        
        -- Override the command with our fixed version
        vim.api.nvim_create_user_command("LaunchAvd", function()
            launch_avd_fixed()
        end, { force = true })
    end,
}
