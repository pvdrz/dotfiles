-- never show sign column
vim.api.nvim_set_option('signcolumn', 'no')
-- set gitgutter highlights for line number
-- FIXME: Remove vimscript (Blocked on https://github.com/neovim/neovim/issues/9876).
vim.api.nvim_command('highlight link GitGutterAddLineNr DiffAdd')
vim.api.nvim_command('highlight link GitGutterChangeLineNr DiffChange')
vim.api.nvim_command('highlight link GitGutterDeleteLineNr DiffDelete')
vim.api.nvim_command('highlight link GitGutterChangeDeleteLineNr DiffChange')
-- use highlighting of git changes only in line numbers
vim.api.nvim_set_var('gitgutter_highlight_linenrs', 1)
-- do not load key mappings
vim.api.nvim_set_var('gitgutter_map_keys', 0)
-- make updates faster
vim.api.nvim_set_option('updatetime', 100)
