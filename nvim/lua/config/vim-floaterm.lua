-- exit terminal mode using ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
-- toggle the terminal
vim.keymap.set('', '<F2>', ':FloatermToggle<CR>', { noremap = true })
vim.keymap.set('t', '<F2>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true })
-- use a vertical split
vim.g.floaterm_wintype = 'vsplit'

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.api.nvim_win_set_option(0, 'number', false)
    vim.api.nvim_win_set_option(0, 'relativenumber', false)
  end
})
