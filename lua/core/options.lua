-- ~/.config/nvim/lua/core/options.lua

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Mouse
opt.mouse = 'a'

-- Auto-save settings
opt.autowrite = true
opt.autowriteall = true

-- Update time for CursorHold events
opt.updatetime = 2000

-- Status line
opt.statusline = '%f %m %r %h %w %= %y [%l,%c] %p%%'

-- Color scheme


-- Disable unused providers to reduce startup time
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Suppress deprecation warnings (optional)
vim.deprecate = function() end
