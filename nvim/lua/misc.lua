-- set termguicolors
vim.o.termguicolors = true
-- show line numbers
vim.wo.number = true

-- hide buffers instead of closing them
vim.o.hidden = true
-- no backup files
vim.o.backup = false
-- no swap files
vim.o.swapfile = false
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
  vim.o[option] = value
  vim.bo[option] = value
end)

-- set tabsize to 2 for some languages
local extensions = { 'lua', 'ex', 'exs', 'c', 'h' }

for _, extension in ipairs(extensions) do
  vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*.' .. extension,
    callback = function()
      set_tabsize(2, function(option, value)
        vim.bo[option] = value
      end)
    end
  })
end

-- expand tabs with spaces
vim.o.expandtab = true
vim.bo.expandtab = true
-- adjust to the next indentation level
vim.o.smarttab = true

-- disable netrw
vim.o.loaded_netrwPlugin = 1
