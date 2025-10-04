return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true,
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
        },
        float = {
            transparent = true,
        },
        custom_highlights = function(colors)
            return {
                LineNr = { fg = colors.overlay2 },
                CursorLineNr = { fg = colors.lavender, style = { "bold" } },
                TabLineSel = { bg = colors.pink },
                CmpBorder = { fg = colors.surface2 },
                Pmenu = { bg = colors.none },
                Visual = { bg = colors.pink, fg = colors.base, style = { "bold" } },
            }
        end,
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
