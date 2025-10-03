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
            rust = { "rust-analyzer" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            python = { "isort", "black" },
            sh = { "shfmt" },
            bash = { "shfmt" },
            markdown = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            toml = { "taplo" },
        },
        format_on_save = {
            timeout_ms = 700,
            lsp_format = "fallback",
        },
    },
    init = function(plugin)
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
