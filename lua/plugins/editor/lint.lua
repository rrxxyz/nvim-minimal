return {
    "mfussenegger/nvim-lint",
    optional = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = "mason-org/mason.nvim",
    opts = {
        linters = {
            ktlint = {
                cmd = "ktlint",
                stdin = false,
                args = {
                    "--relative",
                    "--reporter=plain",
                    "--color=never",
                },
            },
        },
        linters_by_ft = { kotlin = { "ktlint" } },
    },
}
