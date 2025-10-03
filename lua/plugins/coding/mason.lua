return {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
        ensure_installed = {
            -- Lua
            "stylua",
            "lua-language-server",
            -- Rust
            "rust-analyzer",
            -- C/C++
            "clangd",
            "clang-format",
            "cmakelang",
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
            "markdownlint",
            -- JSON/YAML
            "jsonlint",
            "yamllint",
            -- Kotlin
            "kotlin-debug-adapter",
            "kotlin-language-server",
            "kotlin-lsp",
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
}
