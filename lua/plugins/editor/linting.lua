return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local lint = require("lint")

        -- Configure linters for different file types
        lint.linters_by_ft = {
            c = { "gcc" },
        }

        -- Pattern to match GCC error format: file:line:column: severity: message
        local pattern = [[^([^:]+):(%d+):(%d+):%s*([^:]+):%s*(.*)$]]
        local groups = { "file", "lnum", "col", "severity", "message" }
        local severity_map = {
            ["error"] = vim.diagnostic.severity.ERROR,
            ["warning"] = vim.diagnostic.severity.WARN,
            ["note"] = vim.diagnostic.severity.HINT,
        }

        -- Configure GCC as a linter
        lint.linters.gcc = {
            name = "gcc",
            cmd = "gcc",
            stdin = false,
            append_fname = true,
            args = {
                "-fsyntax-only", -- Only check syntax, don't compile
                "-Wall", -- Enable all warnings
                "-Wextra", -- Enable extra warnings
                "-Wpedantic", -- Strict ISO C compliance warnings
                "-std=c99", -- Use C11 standard (change to c99, c17, etc. as needed)
            },
            stream = "stderr",
            ignore_exitcode = true,
            env = nil,
            parser = require("lint.parser").from_pattern(
                pattern,
                groups,
                severity_map,
                { ["source"] = "gcc" }
            ),
        }

        -- Set up autocommands to trigger linting
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
