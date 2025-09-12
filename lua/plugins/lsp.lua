return {
    -- Mason for LSP server management
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts = {
            ensure_installed = {
                -- Lua
                "stylua",
                "lua-language-server",
                -- Rust (handled by rustaceanvim)
                -- "rust-analyzer",
                -- C/C++
                "clangd",
                "clang-format",
                -- Python
                "pyright",
                "black",
                "isort",
                "ruff",
                -- Bash
                "bash-language-server",
                "shellcheck",
                "shfmt",
                -- Markdown
                "marksman",
                "prettier",
                -- Kotlin
                "kotlin-language-server",
                "ktlint",
                -- Additional formatters
                "taplo",
                -- Debug adapters
                "codelldb",
                "debugpy",
                "bash-debug-adapter",
                "gradle-language-server",
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            mr:on("package:install:success", function()
                vim.defer_fn(function()
                    require("lazy.core.handler.event").trigger({
                        event = "FileType",
                        buf = vim.api.nvim_get_current_buf(),
                    })
                end, 100)
            end)

            mr.refresh(function()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end)
        end,
    },

    -- LSP configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        dependencies = {
            "mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        opts = {
            servers = {
                gradle_ls = {},
                kotlin_language_server = {},
                -- Lua LSP
                lua_ls = {
                    Lua = {
                        completion = {
                            keywordSnippet = "Both",
                            displayContext = 5,
                            callSnippet = "Both",
                            workspaceWord = true,
                            showWord = "Disable",
                        },
                        diagnostics = {
                            neededFileStatus = "Opened",
                            groupSeverity = {
                                strong = "Warning",
                                strict = "Warning",
                            },
                            groupFileStatus = {
                                ["ambiguity"] = "Opened",
                                ["await"] = "Opened",
                                ["codestyle"] = "None",
                                ["duplicate"] = "Opened",
                                ["global"] = "Opened",
                                ["luadoc"] = "Opened",
                                ["redefined"] = "Opened",
                                ["strict"] = "Opened",
                                ["strong"] = "Opened",
                                ["type-check"] = "Opened",
                                ["unbalanced"] = "Opened",
                                ["unused"] = "Opened",
                            },
                        },
                        runtime = {
                            version = "LuaJIT",
                            pathStrict = true,
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                                [vim.fn.stdpath("data") .. "/lazy"] = true,
                            },
                            checkThirdParty = false,
                            maxPreload = 100000,
                            preloadFileSize = 10000,
                        },
                        telemetry = { enable = false },
                        hint = {
                            enable = true,
                            setType = true,
                            paramType = true,
                            paramName = "Disable",
                            semicolon = "Disable",
                            arrayIndex = "Disable",
                        },
                        format = {
                            enable = false,
                        },
                    },
                },

                -- Rust LSP is handled by rustaceanvim plugin

                -- C/C++ LSP
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                    },
                    init_options = {
                        usePlaceholders = true,
                        completeUnimported = true,
                        clangdFileStatus = true,
                    },
                    root_dir = function(fname)
                        return require("lspconfig.util").root_pattern(
                            "Makefile",
                            "configure.ac",
                            "configure.in",
                            "config.h.in",
                            "meson.build",
                            "meson_options.txt",
                            "build.ninja"
                        )(fname) or require("lspconfig.util").root_pattern(
                            "compile_commands.json",
                            "compile_flags.txt"
                        )(fname) or vim.fs.dirname(
                            vim.fs.find(".git", { upward = true })[1]
                        )
                    end,
                },

                -- Python LSP
                pyright = {},

                -- Bash LSP
                bashls = {},

                -- Markdown LSP
                marksman = {},
            },
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            local util = require("lspconfig.util")

            -- Setup mason-lspconfig with explicit handlers to prevent rust_analyzer conflict
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd", 
                    "pyright",
                    "bashls",
                    "marksman",
                    "kotlin_language_server",
                    "gradle_ls",
                    -- Explicitly exclude rust_analyzer - handled by rustaceanvim
                },
                automatic_installation = true,
                handlers = {
                    -- Default handler for most servers
                    function(server_name)
                        -- Skip rust_analyzer completely - handled by rustaceanvim
                        if server_name == "rust_analyzer" then
                            return
                        end
                        
                        local server_config = opts.servers[server_name] or {}
                        server_config.capabilities = require("blink.cmp").get_lsp_capabilities(server_config.capabilities)
                        lspconfig[server_name].setup(server_config)
                    end,
                    
                    -- Explicit handler for rust_analyzer to prevent setup
                    ["rust_analyzer"] = function() 
                        -- Do nothing - rustaceanvim handles this
                    end,
                },
            })

            -- Configure kotlin-lsp using the new vim.lsp.config method
            vim.lsp.config("kotlin-lsp", {
                cmd = { "kotlin-lsp", "--stdio" },
                filetypes = { "kotlin" },
                root_dir = util.root_pattern(
                    "settings.gradle",
                    "settings.gradle.kts",
                    "build.gradle",
                    "build.gradle.kts",
                    "pom.xml",
                    ".git"
                ),
                settings = {},
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            -- Modern LSP floating window border configuration
            vim.o.winborder = "rounded"

            -- Diagnostic configuration
            vim.diagnostic.config({
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                },
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "✘",
                        [vim.diagnostic.severity.WARN] = "▲",
                        [vim.diagnostic.severity.HINT] = "⚑",
                        [vim.diagnostic.severity.INFO] = "»",
                    },
                },
            })
        end,
    },
}
