-- exit terminal mode using ESC
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

local dap_ui = require('dapui')

require('toggleterm').setup({
  open_mapping = '<F2>',
  insert_mappings = true,
  terminal_mappings = true,
  shading_factor = -10,
  on_open = function(_)
    if vim.g.dap_is_open then
      vim.g.term_closed_dap = true
      vim.g.dap_is_open = false
      dap_ui.close()
    end
  end,
  on_close = function(_)
    if vim.g.term_closed_dap then
      vim.g.term_closed_dap = false
      vim.g.dap_is_open = true
      dap_ui.open({ reset = true })
    end
  end
})
