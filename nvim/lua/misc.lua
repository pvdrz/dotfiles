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


local function set_tabsize(tabsize, set_fn)
  for _, name in pairs({ 'tabstop', 'softtabstop', 'shiftwidth' }) do
    set_fn(name, tabsize)
  end
end

-- set default tabsize
set_tabsize(4, function(option, value)
  vim.api.nvim_set_option(option, value)
  vim.api.nvim_buf_set_option(0, option, value)
end)

-- set tabsize for lua
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.lua',
  callback = function()
    set_tabsize(2, function(option, value)
      vim.api.nvim_buf_set_option(0, option, value)
    end)
  end
})

-- expand tabs with spaces
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_buf_set_option(0, 'expandtab', true)
-- adjust to the next indentation level
vim.api.nvim_set_option('smarttab', true)

-- disable netrw
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
