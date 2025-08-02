return {
    -- Autoformat
    {
        'stevearc/conform.nvim',
        opts = {},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            })

            -- Set up the format keybinding
            vim.keymap.set({ "n", "v" }, "<leader>f", function()
                require("conform").format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                })
            end, { desc = "Format file or range" })
        end
    },
}
