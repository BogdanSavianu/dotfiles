local map_list = {
  -- ["w|"] = ":vsplit", ["w-"] = ":split", -- w| / w- pour créer des splits verticaux et horizontaux
  -- ["ge"] = ":bprevious", ["gn"] = ":bnext",
  ["W"] = ":w", ["<C-t>"] = ":tabnew",
}

local keymap = vim.keymap.set

for key, binding in pairs(map_list) do
  keymap("n", key, binding .. "<CR>", { noremap = true, silent = true })
end

-- [[ kickstart.nvim ]]
-- Keymaps for better default experience
-- See `:help remap()`
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

keymap({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = true, desc = "[Y]ank to system clipboard" })
keymap({ "n", "v" }, "<Leader>p", '"+p', { noremap = true, silent = true, desc = "[P]ast from system clipboard" })

-- z0…z9 to open folds to a certain level
for i = 0, 9 do
  keymap('n', 'z' .. i, ':set fdl=' .. i .. '<CR>', { noremap = true, silent = false })
end

-- in :terminal esc exits edit mode
keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
