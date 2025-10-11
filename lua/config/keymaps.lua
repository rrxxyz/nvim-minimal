local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better up/down
keymap.set(
    { "n", "x" },
    "j",
    "v:count == 0 ? 'gj' : 'j'",
    { desc = "Down", expr = true, silent = true }
)
keymap.set(
    { "n", "x" },
    "k",
    "v:count == 0 ? 'gk' : 'k'",
    { desc = "Up", expr = true, silent = true }
)
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump into half page down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump into half page up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump into search but keep cursor in the center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jum into search but keep cursor in the center" })

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Yank and Paste
keymap.set("x", "<leader>p", [["_d"+P]], { desc = "Paste clipboard without losing it" })
keymap.set({ "n", "v" }, "<leader>y", "+y", { desc = "Yank into system clipboard" })
keymap.set("n", "<leader>Y", "+Y", { desc = "Yank into system clipboard" })
keymap.set("n", "<C-a>", "ggVG", { desc = "V to All" })

-- Move Lines
keymap.set("n", "<S-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap.set("n", "<S-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap.set("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- buffers
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- Buffer deletion is now handled by Snacks

-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Save file
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Snacks keymaps are now defined in the plugin configuration

-- LSP
keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Goto Definition" })
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Goto Declaration" })
keymap.set("n", "gr", function()
    Snacks.picker.lsp_references()
end, { desc = "References" })
keymap.set("n", "gI", function()
    Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
keymap.set("n", "gt", function()
    Snacks.picker.lsp_type_definitions()
end, { desc = "Goto Type Definition" })
keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover" })
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
-- keymap.set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format" })

-- Diagnostics
keymap.set("n", "<leader>cd", function()
    Snacks.picker.diagnostics({ current_buffer = true })
end, { desc = "Document Diagnostics" })
keymap.set("n", "<leader>cD", function()
    Snacks.picker.diagnostics()
end, { desc = "Workspace Diagnostics" })
keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next Diagnostic" })
keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnostic" })

-- Additional LSP keymaps for Snacks picker
keymap.set("n", "<leader>cs", function()
    Snacks.picker.lsp_symbols()
end, { desc = "Document Symbols" })
keymap.set("n", "<leader>cS", function()
    Snacks.picker.lsp_symbols({ workspace = true })
end, { desc = "Workspace Symbols" })

-- Lua keymaps (Neovim specific)
keymap.set("n", "<leader>lr", "<cmd>luafile %<cr>", { desc = "Source Lua File" })
keymap.set("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Open Lazy" })
keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Open Mason" })
keymap.set("n", "<leader>ls", "<cmd>Lazy sync<cr>", { desc = "Lazy Sync" })

-- Quick run current file based on filetype
keymap.set("n", "<leader>R", function()
    local filetype = vim.bo.filetype
    local file = vim.fn.expand("%")

    if filetype == "rust" then
        vim.cmd("!cargo run")
    elseif filetype == "python" then
        vim.cmd("!python " .. file)
    elseif filetype == "c" then
        vim.cmd("!clang " .. file .. " -o a.out && ./a.out")
    elseif filetype == "cpp" then
        vim.cmd("!clang++ " .. file .. " -o a.out && ./a.out")
    elseif filetype == "sh" or filetype == "bash" then
        vim.cmd("!bash " .. file)
    elseif filetype == "lua" then
        vim.cmd("luafile " .. file)
    elseif filetype == "markdown" then
        vim.cmd("!glow " .. file)
    else
        vim.notify("No run command defined for filetype: " .. filetype, vim.log.levels.WARN)
    end
end, { desc = "Quick Run Current File" })
