--[[
=====================================================================
==================== MODULAR NEOVIM CONFIGURATION ================
=====================================================================

This configuration has been organized into modules for better maintainability.

Structure:
- lua/config/       - Core Neovim configuration
- lua/plugins/      - Plugin configurations

To add new plugins, create files in lua/plugins/ and they'll be loaded automatically.

For more information, see:
- :help lua-guide
- https://neovim.io/doc/user/lua-guide.html
--]]

-- Load core configuration
require 'config.options' -- Basic Neovim options
require 'config.keymaps' -- Key mappings
require 'config.autocmds' -- Autocommands
require 'config.lazy' -- Bootstrap lazy.nvim

-- Configure and install plugins
-- To check plugin status: :Lazy
-- To update plugins: :Lazy update
require('lazy').setup({
  -- Import all plugin configurations from lua/plugins/
  { import = 'plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et

