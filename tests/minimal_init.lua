-- Minimal init for testing
vim.opt.rtp:prepend('.')
vim.opt.rtp:prepend(vim.fn.stdpath('data') .. '/lazy/plenary.nvim')

-- Only load plenary for testing
require('plenary.busted')