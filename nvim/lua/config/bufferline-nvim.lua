local opts = { noremap = true, silent = true }

-- Move to previous/next
vim.keymap.set('n', '<A-Left>', '<Cmd>BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<A-Right>', '<Cmd>BufferLineCycleNext<CR>', opts)

local highlights = require('nord').bufferline.highlights({
  italic = true,
  bold = true,
  fill = '#181c24'
})

require('bufferline').setup({
  options = {
    separator_style = 'slant',
  },
  highlights = highlights,
})
