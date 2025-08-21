-- Given hightlight when do yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("nvim-minimal-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
