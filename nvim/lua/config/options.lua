-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- General options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- Clipboard settings
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Indentation and formatting
vim.opt.breakindent = true
vim.opt.undofile = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI settings
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Folding settings
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99 

-- Force spaces instead of tabs globally
vim.opt.expandtab = true     -- Use spaces instead of tabs
vim.opt.tabstop = 2          -- Number of spaces tabs count for
vim.opt.softtabstop = 2      -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 2       -- Size of an indent
vim.opt.autoindent = true    -- Copy indent from current line when starting new line 