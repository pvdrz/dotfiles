-- remap leader
vim.g.mapleader = ','

-- use backspace to delete to blackhole register
vim.api.nvim_set_keymap('', '<BS>', '"_d', {})
vim.api.nvim_set_keymap('', '<BS><BS>', '"_dd', {})
