return {
    {

        "p00f/clangd_extensions.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "h", "hpp" },
        keys = {
            {
                "gh",
                "<cmd>ClangdSwitchSourceHeader<CR>",
                desc = "[C/C++] Swith between source and header file",
                ft = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp" },
            },
            {
                "<leader>ch",
                "<cmd>ClangdTypeHierarchy<CR>",
                desc = "[C/C++] Show C/C++ Type hierarchy",
                ft = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp" },
            },
        },
        opts = {
            inlay_hints = {
                inline = false,
            },
            ast = {
                --These require codicons (https://github.com/microsoft/vscode-codicons)
                role_icons = {
                    type = "",
                    declaration = "",
                    expression = "",
                    specifier = "",
                    statement = "",
                    ["template argument"] = "",
                },
                kind_icons = {
                    Compound = "",
                    Recovery = "",
                    TranslationUnit = "",
                    PackExpansion = "",
                    TemplateTypeParm = "",
                    TemplateTemplateParm = "",
                    TemplateParamObject = "",
                },
            },
        },
    },
}
