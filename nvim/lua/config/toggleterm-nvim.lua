-- exit terminal mode using ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

require('toggleterm').setup({
    open_mapping = '<F2>',
    insert_mappings = true,
    terminal_mappings = true,
    shading_factor = -10,
})
