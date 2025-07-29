-- ~/.config/nvim/init.lua (Linux/Mac) or ~/AppData/Local/nvim/init.lua (Windows)

-- Load core settings
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Load lazy.nvim plugin manager
require('plugins.lazy')
