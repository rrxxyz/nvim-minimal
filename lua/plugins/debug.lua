return {
    -- Debug adapter protocol
    {
        "mfussenegger/nvim-dap",
        dependencies = "mason-org/mason.nvim",
        -- stylua: ignore
        keys = {
            { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
            { "<leader>dc", function() require("dap").continue() end,                                             desc = "Run/Continue" },
            { "<leader>da", function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
            { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
            { "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
            { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
            { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
            { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
            { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
            { "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
            { "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
            { "<leader>dP", function() require("dap").pause() end,                                                desc = "Pause" },
            { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
            { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
            { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
            { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
        },
        config = function()
            local dap = require("dap")
            if not dap.adapters.kotlin then
                dap.adapters.kotlin = {
                    type = "executable",
                    command = "kotlin-debug-adapter",
                    options = { auto_continue_if_many_stopped = false },
                }
            end

            dap.configurations.java = {
                {
                    type = "java",
                    request = "attach",
                    name = "Debug (Attach) - Remote",
                    hostName = "127.0.0.1",
                    port = 5005,
                },
            }

            dap.configurations.kotlin = {
                {
                    type = "kotlin",
                    request = "launch",
                    name = "This file",
                    -- may differ, when in doubt, whatever your project structure may be,
                    -- it has to correspond to the class file located at `build/classes/`
                    -- and of course you have to build before you debug
                    mainClass = function()
                        local root = vim.fs.find(
                            "src",
                            { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME }
                        )[1] or ""
                        local fname = vim.api.nvim_buf_get_name(0)
                        -- src/main/kotlin/websearch/Main.kt -> websearch.MainKt
                        return fname
                            :gsub(root, "")
                            :gsub("main/kotlin/", "")
                            :gsub(".kt", "Kt")
                            :gsub("/", ".")
                            :sub(2, -1)
                    end,
                    projectRoot = "${workspaceFolder}",
                    jsonLogFile = "",
                    enableJsonLogging = false,
                },
                {
                    -- Use this for unit tests
                    -- First, run
                    -- ./gradlew --info cleanTest test --debug-jvm
                    -- then attach the debugger to it
                    type = "kotlin",
                    request = "attach",
                    name = "Attach to debugging session",
                    port = 5005,
                    args = {},
                    projectRoot = vim.fn.getcwd,
                    hostName = "localhost",
                    timeout = 2000,
                },
            }
        end,
    },

    -- DAP UI
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        keys = {
            {
                "<leader>du",
                function()
                    require("dapui").toggle({})
                end,
                desc = "Dap UI",
            },
            {
                "<leader>de",
                function()
                    require("dapui").eval()
                end,
                desc = "Eval",
                mode = { "n", "v" },
            },
        },
        opts = {},
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },
    -- virtual text for the debugger
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
    },
}
