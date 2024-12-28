--[[
-- Contains fixes for mappings created by plugins
-- Useful because of bépo
--]]

-- Comments.nvim adds `gbc` command, which conflicts with `gb/gé` to move
-- between tabs
if vim.fn.maparg("gbc") ~= "" then
  vim.keymap.del("n", "gbc")
  vim.keymap.set('n', 'gBc', function()
    return vim.api.nvim_get_vvar('count') == 0 and '<Plug>(comment_toggle_blockwise_current)'
        or '<Plug>(comment_toggle_blockwise_count)'
  end, { expr = true, desc = 'Comment toggle current block' })
end
