return {
    {
        "saghen/blink.cmp",
        lazy = false,
        dependencies = "rafamadriz/friendly-snippets",
        version = "1.*",
        opts = {
            keymap = {
                preset = "default",
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = { "snippet_forward", "select_and_accept", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "fallback" },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "normal"
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            completion = { documentation = { auto_show = false } },
            fuzzy = { implementation = "lua" }
        },
        opts_extend = { "sources.default" }
    },
}
