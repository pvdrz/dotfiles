-- hide buffers instead of closing them
vim.api.nvim_set_option('hidden', true)
-- no backup files
vim.api.nvim_set_option('backup', false)
-- no swap files
vim.api.nvim_set_option('swapfile', false)
-- close preview/scratch window
-- FIXME: Remove vimscript.
vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')
-- enable mouse
vim.api.nvim_set_option('mouse', 'a')
-- enable system clipboard
-- FIXME: Remove vimscript.
vim.api.nvim_command('set clipboard+=unnamedplus')
-- wrap left and right to next line
-- FIXME: Remove vimscript.
vim.api.nvim_command('set whichwrap+=<,>,[,]')
-- delete trailing whitespaces on save
-- FIXME: Remove vimscript.
vim.api.nvim_command('autocmd BufWritePre * :FixWhitespace')
-- set number of spaces for tab
-- vim.api.nvim_set_option('ts', 4)
-- set number of spaces for reindent
-- vim.api.nvim_set_option('shiftwidth', 4)
-- use spaces instead of tabs
vim.api.nvim_set_option('expandtab', true)
-- adjust to the next indentation level
vim.api.nvim_set_option('smarttab', true)
-- disable netrw
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
