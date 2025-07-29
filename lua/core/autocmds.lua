-- ~/.config/nvim/lua/core/autocmds.lua

local augroup = vim.api.nvim_create_augroup('UserConfig', {})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    pattern = '*',
    callback = function()
        local save_cursor = vim.fn.getpos('.')
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos('.', save_cursor)
    end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup,
    callback = function()
        vim.hl.on_yank({ higroup = 'Visual', timeout = 200 })
    end,
})

-- File type specific settings
vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    pattern = { 'python', 'cpp', 'c' },
    callback = function()
        vim.opt_local.colorcolumn = '80'
    end,
})


-- Formatter
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
