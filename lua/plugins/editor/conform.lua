return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true })
            end,
            mode = { "n", "v" },
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            kotlin = { "ktlint" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            python = { "ruff_fix", "ruff_format", "black", "isort" },
            sh = { "shfmt" },
            bash = { "shfmt" },
            markdown = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            toml = { "taplo" },
        },
        formatters = {
            clang_format = {
                prepend_args = { "--style=file" },
            },
            ruff_fix = {
                command = "ruff",
                args = { "check", "--fix", "--exit-zero", "--stdin-filename", "$FILENAME", "-" },
                stdin = true,
            },
            ruff_format = {
                command = "ruff",
                args = { "format", "--stdin-filename", "$FILENAME", "-" },
                stdin = true,
            },
            ktlint = {
                command = "ktlint",
                args = {
                    "--format",
                    "$FILENAME",
                    "--stdin",
                    "--log-level=none",
                },
                stdin = true,
            },
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = "fallback",
        },
    },
    init = function(plugin)
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
