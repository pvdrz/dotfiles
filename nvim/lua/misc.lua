-- hide buffers instead of closing them
vim.api.nvim_set_option('hidden', true)
-- no backup files
vim.api.nvim_set_option('backup', false)
-- no swap files
vim.api.nvim_set_option('swapfile', false)
-- close preview/scratch window
vim.api.nvim_set_option('completeopt', 'menuone,noselect')
-- enable mouse
vim.api.nvim_set_option('mouse', 'a')
-- enable system clipboard
vim.api.nvim_set_option('clipboard', 'unnamedplus')
-- wrap left and right to next line
vim.api.nvim_set_option('whichwrap', 'b,s,<,>,[,]')
-- delete trailing whitespaces on save
-- FIXME: Remove vimscript (Blocked on: https://github.com/neovim/neovim/pull/12378).
vim.api.nvim_command('autocmd BufWritePre * :FixWhitespace')
-- set number of spaces for tab
vim.api.nvim_set_option('ts', 4)
-- set number of spaces for reindent
vim.api.nvim_set_option('shiftwidth', 4)
-- set alternative number of spaces for latex and elixir
-- FIXME: Remove vimscript (Blocked on: https://github.com/neovim/neovim/pull/12378).
vim.api.nvim_command('autocmd Filetype tex setlocal ts=2 sw=2')
vim.api.nvim_command('autocmd Filetype elixir setlocal ts=2 sw=2')
-- use spaces instead of tabs
vim.api.nvim_set_option('expandtab', true)
-- adjust to the next indentation level
vim.api.nvim_set_option('smarttab', true)
-- disable netrw
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
