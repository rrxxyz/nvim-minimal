return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
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
            kotlin_lsp = {
                filetypes = { "kotlin" },
                cmd = { "kotlin-lsp", "--stdio" },
                root_dir = function(fname)
                    return require("lspconfig.util").root_pattern(
                        "settings.gradle",
                        "settings.gradle.kts",
                        "build.gradle",
                        "build.gradle.kts",
                        "pom.xml",
                        "workspace.json"
                    )(fname)
                end,
            },
            lua_ls = {},
            rust_analyzer = { enabled = false },
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
                        "build.ninja",
                        "CMakeLists.txt",
                        ".git"
                    )(fname) or require("lspconfig.util").root_pattern(
                        "compile_commands.json",
                        "compile_flags.txt"
                    )(fname) or vim.fs.dirname(
                        vim.fs.find(".git", { upward = true })[1]
                    )
                end,
            },
            pyright = {},
            bashls = {},
            marksman = {},
            neocmake = {},
        },
        setup = {
            clangd = function(_, opts)
                local clangd_ext_opts = {
                    extensions = {
                        -- example extra configs from clangd_extensions.nvim
                        autoSetHints = true,
                        inlay_hints = {
                            only_current_line = false,
                            show_parameter_hints = true,
                            parameter_hints_prefix = "<- ",
                            other_hints_prefix = "=> ",
                        },
                        ast = {
                            role_icons = {
                                type = "",
                                declaration = "",
                                expression = "",
                                specifier = "",
                                statement = "",
                                ["template argument"] = "",
                            },
                        },
                    },
                }
                require("clangd_extensions").setup(
                    vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts })
                )
            end,
        },
    },
    config = function(_, opts)
        local lspconfig = require("lspconfig")
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pyright",
                "bashls",
                "marksman",
                "gradle_ls",
                "neocmake",
                "kotlin_lsp",
                "rust_analyzer",
                "kotlin_language_server",
            },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    local server_config = opts.servers[server_name] or {}
                    server_config.capabilities =
                        require("blink.cmp").get_lsp_capabilities(server_config.capabilities)
                    lspconfig[server_name].setup(server_config)
                end,
            },
        })

        vim.o.winborder = "rounded"

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
}
