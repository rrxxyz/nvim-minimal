return {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end,
    keys = {
        {
            "gh",
            "<cmd>ClangdSwitchSourceHeader<CR>",
            desc = "[C/C++] Swith between source and header file in C",
        },
        {
            "<leader>k",
            "<cmd>ClangdSymbolInfo<CR>",
            desc = "[C/C++] Show symbol information like hint",
        },
        {
            "<leader>ch",
            "<cmd>ClangdTypeHierarchy<CR>",
            desc = "[C/C++] Show C/C++ Type hierarchy",
        },
    },
    opts = {
        inlay_hints = {
            inline = false,
        },
        ast = {
            --These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },
            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },
        },
    },
}
