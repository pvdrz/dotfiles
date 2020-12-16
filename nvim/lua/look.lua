-- enable true colors
vim.api.nvim_set_option('termguicolors', true)
-- show tabline
vim.api.nvim_set_option('showtabline', 2)
-- set theme
-- FIXME: Remove vimscript.
vim.api.nvim_command('colorscheme nord')
-- set line numbers to relative so numbertoggle works as intended
-- FIXME: Remove vimscript.
vim.api.nvim_command('set number relativenumber')
-- highlight current line
vim.api.nvim_set_option('cursorline', true)
