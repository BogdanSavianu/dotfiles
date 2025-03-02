-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load core configurations
require('config.options')
require('config.keymaps')
require('config.autocmds')

-- Initialize plugins
require('config.plugins')
