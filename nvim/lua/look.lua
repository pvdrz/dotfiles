-- show tabline
vim.api.nvim_set_option('showtabline', 2)
-- use uniform background for nord
vim.api.nvim_set_var('nord_uniform_diff_background', 1)
-- set theme
vim.cmd('colorscheme nord')
-- set termguicolors
vim.api.nvim_set_option('termguicolors', true)
-- set line numbers to relative so numbertoggle works as intended
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)
-- highlight current line
vim.api.nvim_set_option('cursorline', true)
-- hide number column from terminal buffers
-- FIXME: Remove vimscript (Blocked on: https://github.com/neovim/neovim/pull/12378).
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber')
-- use terminal background
vim.api.nvim_command('hi Normal ctermbg=none guibg=none')
