local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.load_extension('ui-select')

-- key bindings
local opts = { noremap = true, silent = true }
-- go to type definition
vim.keymap.set('n', '<leader>t', builtin.lsp_type_definitions, opts)
-- go to implementations
vim.keymap.set('n', '<leader>i', builtin.lsp_implementations, opts)
-- show references
vim.keymap.set('n', '<leader>r', builtin.lsp_references, opts)
-- show workspace diagnostics
vim.keymap.set('n', '<leader>w', builtin.diagnostics, opts)

local config = {
  layout_strategy = 'vertical',
  layout_config = { scroll_speed = 1 },
}

local preview = {
  jump_type = 'never',
  layout_strategy = 'vertical',
  layout_config = { scroll_speed = 1, width = 100, preview_height = 0.8 },
}

telescope.setup({
  pickers = {
    -- Default configuration for builtin pickers goes here:
    lsp_type_definitions = preview,
    lsp_definitions = preview,
    lsp_references = preview,
    buffers = preview,
    lsp_implementations = config,
    diagnostics = config,
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown({}),
    }
  }
})
