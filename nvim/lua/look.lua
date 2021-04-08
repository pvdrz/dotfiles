-- show tabline
vim.api.nvim_set_option('showtabline', 2)
-- set theme
vim.cmd('colorscheme spaceduck')
-- set termguicolors
vim.api.nvim_set_option('termguicolors', true)
-- set line numbers to relative so numbertoggle works as intended
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)
-- highlight current line
vim.api.nvim_set_option('cursorline', true)
-- hide number column from terminal buffers
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber')
