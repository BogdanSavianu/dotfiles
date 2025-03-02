-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set indentation for specific file types
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 
    'json', 'jsonc', 'html', 'css', 'javascript', 
    'typescript', 'elm', 'haskell', 'hs'
  },
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.autoindent = true
  end,
}) 