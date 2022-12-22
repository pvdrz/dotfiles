local dap = require('dap')
local dap_ui = require('dapui')

vim.keymap.set('n', '\\b', dap.toggle_breakpoint)
vim.keymap.set('n', '\\c', function() dap.continue() end)
vim.keymap.set('n', '\\o', function() dap_ui.toggle() end)

dap.adapters.codelldb = {
    type = 'server',
    port = '6969',
    executable = {
      command = '/usr/bin/codelldb',
      args = {'--port', '6969'},
    }
}
dap.configurations.rust = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
	args = {},
	runInTerminal = false,
  },
}

dap_ui.setup({})
