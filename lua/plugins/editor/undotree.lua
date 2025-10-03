return {
    "jiaoshijie/undotree",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        { "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo tree" },
    },
}
