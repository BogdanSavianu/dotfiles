--vim.api.nvim_set_keymap('', 'à', '<Nop>', { noremap = true, silent = true })
local neorgroup = vim.api.nvim_create_augroup("neorg", { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "norg" },
  group = neorgroup,
  callback = function()
    vim.g.maplocalleader = ' '
    vim.o.conceallevel = 2
    vim.o.foldlevelstart = 99
    vim.api.nvim_set_keymap("n", "<Leader>nr", ":Neorg return<CR>",
      { noremap = true, silent = true, desc = "[N]eorg [R]eturn" })
  end,
})

-- document existing key chains
require('which-key').add {
  { "<leader>l",   group = "neorg [L]ist" },
  { "<leader>l_",  hidden = true },
  { "<leader>m",   group = "neorg [M]ode" },
  { "<leader>m_",  hidden = true },
  { "<leader>n",   group = "[N]eorg" },
  { "<leader>n_",  hidden = true },
  { "<leader>ne",  group = "[N]eorg [E]xport" },
  { "<leader>ne_", hidden = true },
}

vim.api.nvim_set_keymap("n", "<Leader>ni", ":Neorg index<CR>",
  { noremap = true, silent = true, desc = "[N]eorg [I]ndex" })
vim.api.nvim_set_keymap("n", "<Leader>nm", ":Neorg inject-metadata<CR>",
  { noremap = true, silent = true, desc = "[N]eorg insert [M]etadata" })
vim.api.nvim_set_keymap("n", "<Leader>nj", ":Neorg journal toc open<CR>",
  { noremap = true, silent = true, desc = "[N]eorg [J]ournal" })
vim.api.nvim_set_keymap("n", "<Leader>nt", ":Neorg journal today<CR>",
  { noremap = true, silent = true, desc = "[N]eorg [T]oday" })
vim.api.nvim_set_keymap("n", "<Leader>ns", ":Neorg journal tomorrow<CR>",
  { noremap = true, silent = true, desc = "Neorg  tomorrow" })
vim.api.nvim_set_keymap("n", "<Leader>ny", ":Neorg journal yesterday<CR>",
  { noremap = true, silent = true, desc = "[N]eorg [Y]esterday" })
vim.api.nvim_set_keymap("n", "<Leader>neo", ":e /tmp/neorg-export.md<CR>",
  { noremap = true, silent = true, desc = "[N]eorg [E]xport [O]pen" })
vim.api.nvim_set_keymap("n", "<Leader>nee", ":Neorg export to-file /tmp/neorg-export.md<CR>",
  { noremap = true, silent = true, desc = "[N]eorg [E]xport Predefined" })
vim.api.nvim_set_keymap("n", "<Leader>nef", ":Neorg export to-file ",
  { noremap = true, silent = true, desc = "[N]eorg [E]xport [F]ile" })
