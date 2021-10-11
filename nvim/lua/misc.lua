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
-- wrap left and right to next line
vim.api.nvim_set_option('whichwrap', '<,>,[,]')
-- delete trailing whitespaces on save
-- FIXME: Remove vimscript (Blocked on: https://github.com/neovim/neovim/pull/12378).
vim.api.nvim_command('autocmd BufWritePre * :FixWhitespace')
-- set number of spaces per tab
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_buf_set_option(0, 'tabstop', 4)
-- set number of spaces per tab when editing
vim.api.nvim_set_option('softtabstop', 4)
vim.api.nvim_buf_set_option(0, 'softtabstop', 4)
-- set number of spaces for autoindent
vim.api.nvim_set_option('shiftwidth', 4)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 4)
-- expand dabs with spaces
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_buf_set_option(0, 'expandtab', true)
-- set alternative number of spaces for latex and elixir
-- FIXME: Remove vimscript (Blocked on: https://github.com/neovim/neovim/pull/12378).
vim.api.nvim_command('autocmd Filetype tex setlocal tabstop=2 softtabstop=2 shiftwidth=2')
vim.api.nvim_command('autocmd Filetype elixir setlocal tabstop=2softtabstop=2 shiftwidth-2')

-- adjust to the next indentation level
vim.api.nvim_set_option('smarttab', true)
-- disable netrw
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
