-- show tabline
vim.api.nvim_set_option('showtabline', 2)
-- disable italics for dracula, this must be done before setting the theme
vim.api.nvim_set_var('dracula_italic', '0')
-- set theme
vim.api.nvim_set_var('colors_name', 'dracula')
-- set termguicolors
vim.api.nvim_set_option('termguicolors', true)
-- set line numbers to relative so numbertoggle works as intended
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)
-- highlight current line
vim.api.nvim_set_option('cursorline', true)
