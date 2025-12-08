return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    branch = "main",
    build = ":TSUpdate",
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
        { "<c-space>", desc = "Increment Selection" },
        { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    opts = {
        indent = { enable = true }, ---@type lazyvim.TSFeat
        highlight = { enable = true }, ---@type lazyvim.TSFeat
        folds = { enable = true }, ---@type lazyvim.TSFeat
        ensure_installed = {
            "c",
            "cpp",
            "python",
            "rust",
            "lua",
            "bash",
            "markdown",
            "kotlin",
            "c_sharp",
            "dart",
            "cmake",
            "c3",
            "mojo",
            "make",
            "dockerfile",
            "toml",
            "yaml",
            "json",
            "markdown_inline",
            "luadoc",
            "luap",
            "vim",
            "vimdoc",
            "query",
            "regex",
            "git_config",
            "git_rebase",
            "gitcommit",
            "gitignore",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    },
    opts_extend = { "ensure_installed" },
}
