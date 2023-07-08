-- exit terminal mode using ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
-- toggle the terminal
vim.keymap.set('', '<F2>', ':FloatermToggle<CR>', { noremap = true })
vim.keymap.set('t', '<F2>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true })
-- use a vertical split
vim.g.floaterm_wintype = 'split'
-- set the terminal height
vim.g.floaterm_height = 0.3
-- open files in a new tab
vim.g.floaterm_opener = 'tabe'
-- don't enter terminal mode after opening a temrina;
vim.g.floaterm_autoinsert = false

local function run_in_terminal(cmd)
  local n = #vim.fn["floaterm#buflist#gather"]()
  if n == 0 then
    vim.cmd.FloatermNew()
  end
  vim.cmd.FloatermSend(cmd)
end

vim.keymap.set('n', '<C-c><C-c>', function() run_in_terminal("cargo check") end)
vim.keymap.set('n', '<C-c><C-b>', function() run_in_terminal("cargo build") end)
vim.keymap.set('n', '<C-c><C-t>', function() run_in_terminal("cargo test") end)
vim.keymap.set('n', '<C-c><C-l>', function() run_in_terminal("cargo +nightly clippy") end)

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.api.nvim_win_set_option(0, 'number', false)
    vim.api.nvim_win_set_option(0, 'relativenumber', false)
  end
})
