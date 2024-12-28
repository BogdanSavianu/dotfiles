local markdown = vim.api.nvim_create_augroup("markdown", { clear = true })
local spelling = vim.api.nvim_create_augroup("spelling", { clear = true })

-- Recognize .md as pandoc
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.md", },
  group = markdown,
  callback = function()
    vim.o.filetype = 'pandoc'
    vim.o.commentstring = '<!--%s-->'
    require('luasnip').filetype_extend("pandoc", { "markdown" })
    vim.o.spell = true
    require('spelling').spell_keymap()
    vim.o.spelllang = 'en'
    vim.o.formatoptions = "qj"
    -- email commands: my/msy to paste the html inside the clipboard
    vim.keymap.set('', '<LocalLeader>msy', ':w !pandoc -f markdown+emoji -t html5 -s | wl-copy --type text/html<CR><CR>',
      { noremap = true, silent = true, desc = "[M]arkdown to [S]ingle page [Y]ank" })
    vim.keymap.set('', '<LocalLeader>my', ':w !pandoc -f markdown+emoji --wrap=none -t html5 | wl-copy --type text/html<CR><CR>',
      { noremap = true, silent = true, desc = "[M]arkdown to HTML [Y]ank" })
    vim.keymap.set('', '<LocalLeader>mp', '<Plug>MarkdownPreviewToggle', { noremap = true, silent = true, desc = "[M]arkdown [Preview]" })
  end
})

-- French markdown files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*-fr.md", },
  group = markdown,
  callback = function()
    vim.o.spelllang = 'fr'
  end
})

-- Spell shortcuts
vim.api.nvim_create_autocmd({ "OptionSet" }, {
  pattern = { "spell" },
  group = spelling,
  callback = require('spelling').spell_keymap
})

-- LaTeX configuration
local texgroup = vim.api.nvim_create_augroup("latex", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "latex", "tex" },
  group = texgroup,
  callback = function()
    -- vimtex configuration
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.maplocalleader = ' '
    -- Legacy shortcut from my vim-latexsuite days
    vim.api.nvim_set_keymap("n", "<Leader>ls", ":VimtexView<CR>",
      { noremap = true, silent = true, desc = 'View [L]atex Document' })

    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'vimtex#fold#level(v:lnum)'
    vim.o.foldtext = 'vimtex#fold#text()'
    vim.o.spell = true
    require('spelling').spell_keymap()
  end,
})