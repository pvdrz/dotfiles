-- never show sign column
vim.api.nvim_win_set_option(0, 'signcolumn', 'no')
-- set gitgutter highlights for line number
-- FIXME: Remove vimscript (Blocked on https://github.com/neovim/neovim/issues/9876).
vim.cmd('highlight link GitGutterAddLineNr DiffAdd')
vim.cmd('highlight link GitGutterChangeLineNr DiffChange')
vim.cmd('highlight link GitGutterDeleteLineNr DiffDelete')
vim.cmd('highlight link GitGutterChangeDeleteLineNr DiffChange')
-- use highlighting of git changes only in line numbers
vim.api.nvim_set_var('gitgutter_highlight_linenrs', 1)
-- do not load key mappings
vim.api.nvim_set_var('gitgutter_map_keys', 0)
-- make updates faster
vim.api.nvim_set_option('updatetime', 100)
