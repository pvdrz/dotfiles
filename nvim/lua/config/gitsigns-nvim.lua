local gitsigns = require('gitsigns')

-- key bindings
local opts = { noremap = true, silent = true }
-- go to next hunk
vim.keymap.set('n', '<leader>h', gitsigns.next_hunk, opts)
-- go to previous hunk
vim.keymap.set('n', '<leader>H', gitsigns.prev_hunk, opts)
-- show blame for current line
vim.keymap.set('n', '<leader>b', function() gitsigns.blame_line({ full = true }) end, opts)
-- undo hunk
vim.keymap.set('n', '<leader>u', gitsigns.reset_hunk, opts)

gitsigns.setup({
  -- don't show signs for diffs
  signcolumn = false,
  -- use line number higlighting for diffs
  numhl = true,
})
