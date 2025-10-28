local function augroup(name)
    return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("checktime"),
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup("last_loc"),
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc then
            return
        end
        vim.b[buf].last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Auto create dir when saving a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Language-specific settings (table-driven approach)
local lang_settings = {
    {
        fts = { "c", "cpp" },
        tabstop = 2,
        shiftwidth = 2,
        expandtab = true,
        commentstring = "// %s",
    },
    { fts = { "python" }, tabstop = 4, shiftwidth = 4, expandtab = true },
    { fts = { "rust" }, tabstop = 4, shiftwidth = 4, expandtab = true },
    { fts = { "sh", "bash" }, tabstop = 2, shiftwidth = 2, expandtab = true },
    { fts = { "lua" }, tabstop = 2, shiftwidth = 2, expandtab = true },
    { fts = { "markdown" }, tabstop = 2, shiftwidth = 2, expandtab = true, conceallevel = 2 },
}

for _, config in ipairs(lang_settings) do
    vim.api.nvim_create_autocmd("FileType", {
        group = augroup("lang_" .. table.concat(config.fts, "_")),
        pattern = config.fts,
        callback = function()
            if config.tabstop then
                vim.opt_local.tabstop = config.tabstop
            end
            if config.shiftwidth then
                vim.opt_local.shiftwidth = config.shiftwidth
            end
            if config.expandtab ~= nil then
                vim.opt_local.expandtab = config.expandtab
            end
            if config.commentstring then
                vim.opt_local.commentstring = config.commentstring
            end
            if config.conceallevel then
                vim.opt_local.conceallevel = config.conceallevel
            end
        end,
    })
end

-- Show diagnostics in floating window on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
    group = augroup("diagnostic_float"),
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "if_many",
            prefix = " ",
            scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
    end,
})
