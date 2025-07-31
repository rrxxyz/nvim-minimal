-- ~/.config/nvim/lua/core/keymaps.lua

-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })

-- Window navigation
keymap.set('n', '<leader>e', ':Ex<CR>', { desc = 'File Explorer' })
keymap.set('n', '<leader>[q', ':cprev<CR>', { desc = 'Go to prev from quick fix' })
keymap.set('n', '<leader>]q', ':cnext<CR>', { desc = 'Go to next from quick fix' })

-- File operations
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>W", ":wa<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>wa<CR><cmd>q<CR>", { desc = "Save and quit" })

-- Move line
keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move blocking text down"})
keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move Blocking text up"})

-- Terminal
local terminal_win = nil
keymap.set("n", "tt", function()
    -- Check if terminal window is already open
    if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
        vim.api.nvim_win_close(terminal_win, false)
        terminal_win = nil
        return
    end

    -- Check if terminal buffer exists
    local terminal_buf = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == 'terminal' then
            terminal_buf = buf
            break
        end
    end

    -- Create new terminal buffer if none exists
    if not terminal_buf then
        terminal_buf = vim.api.nvim_create_buf(false, true)
    end

    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    terminal_win = vim.api.nvim_open_win(terminal_buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded'
    })

    -- Start terminal if buffer is new
    if vim.api.nvim_buf_line_count(terminal_buf) == 1 and vim.api.nvim_buf_get_lines(terminal_buf, 0, 1, false)[1] == "" then
        vim.cmd('terminal')
    end
end, { desc = "Toggle floating terminal" })
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Search and replace
keymap.set("n", "<leader>sp", ":%s/", { desc = "Search and replace" })

-- Remote dangerous key
keymap.set("n", "Q", "<nop>")
