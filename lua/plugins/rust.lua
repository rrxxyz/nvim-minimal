return {
    {
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = false, -- Load immediately for Rust projects
        ft = { "rust" },
        init = function()
            -- Configure rustaceanvim before loading
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(client, bufnr)
                        -- Set up keymaps for Rust-specific actions
                        vim.keymap.set("n", "<leader>cR", function()
                            vim.cmd.RustLsp("codeAction")
                        end, { desc = "Code Action", buffer = bufnr })
                        vim.keymap.set("n", "<leader>dr", function()
                            vim.cmd.RustLsp("debuggables")
                        end, { desc = "Rust Debuggables", buffer = bufnr })

                        -- Print confirmation that LSP attached
                        vim.notify(
                            "rust-analyzer attached to buffer " .. bufnr,
                            vim.log.levels.INFO
                        )
                    end,
                    default_settings = {
                        -- rust-analyzer language server configuration
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                                loadOutDirsFromCheck = true,
                                buildScripts = {
                                    enable = true,
                                },
                            },
                            checkOnSave = {
                                command = "clippy",
                            },
                            diagnostics = {
                                enable = true,
                            },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    ["async-trait"] = { "async_trait" },
                                    ["napi-derive"] = { "napi" },
                                    ["async-recursion"] = { "async_recursion" },
                                },
                            },
                            files = {
                                excludeDirs = {
                                    ".direnv",
                                    ".git",
                                    ".github",
                                    ".gitlab",
                                    "bin",
                                    "node_modules",
                                    "target",
                                    "venv",
                                    ".venv",
                                },
                            },
                        },
                    },
                },
            }
        end,
    },
}
