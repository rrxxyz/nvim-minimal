
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.runtimepath:prepend(lazypath)

-- Setup lazy.nvim with plugin specifications
require("lazy").setup({
  -- Import plugin configurations from separate files
  { import = "plugins.lsp" },
  { import = "plugins.completion" },
  { import = "plugins.editor" },
  { import = "plugins.ui" },
}, {
  checker = {
    enabled = true, -- automatically check for plugin updates
    notify = false, -- don't notify about updates
  },
  change_detection = {
    notify = false, -- don't notify about config changes
  },
  rocks = {
    enabled = false, -- disable luarocks support
  },
})
