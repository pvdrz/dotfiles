local opts = { noremap = true, silent = true }

-- Move to previous/next
vim.keymap.set('n', '<A-Left>', '<Cmd>BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<A-Right>', '<Cmd>BufferLineCycleNext<CR>', opts)

require('bufferline').setup({
    -- animation = false,
    -- icons = false,
})
