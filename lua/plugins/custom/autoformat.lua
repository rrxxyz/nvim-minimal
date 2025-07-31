return {
    -- Autoformat
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort" },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            })
        end
    },
}
