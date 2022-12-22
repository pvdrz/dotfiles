require('keys')
require('plugins')

-- set termguicolors
vim.api.nvim_set_option('termguicolors', true)
-- show line numbers 
vim.api.nvim_win_set_option(0, 'number', true)

-- hide buffers instead of closing them
vim.api.nvim_set_option('hidden', true)
-- no backup files
vim.api.nvim_set_option('backup', false)
-- no swap files
vim.api.nvim_set_option('swapfile', false)
-- close preview/scratch window
vim.o.completeopt = 'menuone,noselect'
-- enable mouse
vim.api.nvim_set_option('mouse', 'a')
-- enable system clipboard
vim.api.nvim_set_option('clipboard', 'unnamedplus')

local tabsize = 4

function nvim_set_glob_option(option, value)
    vim.api.nvim_set_option(option, value)
    vim.api.nvim_buf_set_option(0, option, value)
end
-- set number of spaces per tab
nvim_set_glob_option('tabstop', tabsize)
-- set number of spaces per tab when editing
nvim_set_glob_option('softtabstop', tabsize)
-- set number of spaces for autoindent
nvim_set_glob_option('shiftwidth', tabsize)
-- expand dabs with spaces
nvim_set_glob_option('expandtab', true)
-- adjust to the next indentation level
vim.api.nvim_set_option('smarttab', true)

-- disable netrw
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
