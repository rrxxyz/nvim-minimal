vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Back to file manager" })

vim.keymap.set("n", "]b", vim.cmd.bnext, { desc = "Go to next buffer" })
vim.keymap.set("n", "[b", vim.cmd.bprev, { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>bx", vim.cmd.bdelete, { desc = "Delete current buffer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line Up" })

-- Already taken by trouble nvim
-- vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Quickfix next" })
-- vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Quikfix previous" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste and keep the copy" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Better yank" } )
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Better yank" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump into half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump into half page up" } )

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "V to All" })
vim.keymap.set("n", "<C-y>", "ggVG<leader>y", { desc = "Yank all"} )

