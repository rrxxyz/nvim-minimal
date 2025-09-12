return {
    -- Debug adapter protocol
    {
        "mfussenegger/nvim-dap",
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

            -- CodeLLDB adapter for Rust and C/C++
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            }

            -- Python debugger adapter
            dap.adapters.python = function(cb, config)
                if config.request == "attach" then
                    local port = (config.connect or config).port
                    local host = (config.connect or config).host or "127.0.0.1"
                    cb({
                        type = "server",
                        port = assert(
                            port,
                            "`connect.port` is required for a python `attach` configuration"
                        ),
                        host = host,
                        options = {
                            source_filetype = "python",
                        },
                    })
                else
                    cb({
                        type = "executable",
                        command = "debugpy-adapter",
                        options = {
                            source_filetype = "python",
                        },
                    })
                end
            end

            -- Kotlin debugger adapter
            if not dap.adapters.kotlin then
                dap.adapters.kotlin = {
                    type = "executable",
                    command = "kotlin-debug-adapter",
                    options = { auto_continue_if_many_stopped = false },
                }
            end
            -- Kotlin configurations
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
            -- Bash debugger adapter

            if not dap.adapters.bashdb then
                dap.adapters.bashdb = {
                    type = "executable",
                    command = vim.fn.stdpath("data")
                        .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
                    name = "bashdb",
                }
            end

            -- Rust configurations

            dap.configurations.rust = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/target/debug/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
                {
                    name = "Attach to gdbserver :1234",
                    type = "codelldb",
                    request = "attach",
                    MIMode = "gdb",
                    miDebuggerServerAddress = "localhost:1234",
                    miDebuggerPath = "/usr/bin/gdb",
                    cwd = "${workspaceFolder}",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/target/debug/",
                            "file"
                        )
                    end,
                },
            }

            -- C configurations

            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
                {
                    name = "Launch with arguments",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = function()
                        local args_string = vim.fn.input("Arguments: ")
                        return vim.split(args_string, " ")
                    end,
                },
            }

            -- C++ configurations (same as C)
            dap.configurations.cpp = dap.configurations.c

            -- Python configurations
            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        return "/usr/bin/python3"
                    end,
                },
                {
                    type = "python",
                    request = "attach",
                    name = "Attach remote",
                    connect = function()
                        local host = vim.fn.input("Host [127.0.0.1]: ")
                        host = host ~= "" and host or "127.0.0.1"
                        local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
                        return { host = host, port = port }
                    end,
                },
            }

            -- Bash configurations
            dap.configurations.sh = {
                {
                    type = "bashdb",
                    request = "launch",
                    name = "Launch file",
                    showDebugOutput = true,
                    pathBashdb = vim.fn.stdpath("data")
                        .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
                    pathBashdbLib = vim.fn.stdpath("data")
                        .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
                    trace = true,
                    file = "${file}",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                    pathCat = "cat",
                    pathBash = "/bin/bash",
                    pathMkfifo = "mkfifo",
                    pathPkill = "pkill",
                    args = {},
                    env = {},
                    terminalKind = "integrated",
                },
            }

            -- Set sign icons
            local signs = {
                { name = "DapBreakpoint", text = "🔴", texthl = "DiagnosticSignError" },
                { name = "DapBreakpointCondition", text = "🟡", texthl = "DiagnosticSignWarn" },
                { name = "DapLogPoint", text = "🔵", texthl = "DiagnosticSignInfo" },
                { name = "DapStopped", text = "▶️", texthl = "DiagnosticSignWarn" },
                { name = "DapBreakpointRejected", text = "⚠️", texthl = "DiagnosticSignHint" },
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.texthl })
            end
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
