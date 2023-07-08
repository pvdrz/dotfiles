-- remap leader
vim.g.mapleader = ','

-- use A-d just like d but send everything to the blackhole register
vim.keymap.set('', '<A-d>', '"_d', {})
vim.keymap.set('', '<A-d><A-d>', '"_dd', {})
vim.keymap.set('', '<A-D>', '"_D', {})

-- Navigate splits up and down
vim.keymap.set('n', '<A-Up>', '<C-w><Up>', {})
vim.keymap.set('n', '<A-Down>', '<C-w><Down>', {})
