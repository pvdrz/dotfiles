local dap = require('dap')
local dap_ui = require('dapui')

vim.g.dap_is_open = false
vim.g.term_closed_dap = false

vim.keymap.set('n', '\\b', dap.toggle_breakpoint)
vim.keymap.set('n', '\\c', function() dap.continue() end)
vim.keymap.set('n', '\\o', function()
  if vim.g.dap_is_open then
    vim.g.dap_is_open = false
    dap_ui.close()
  else
    if not vim.g.term_closed_dap then
      vim.g.dap_is_open = true
      dap_ui.open()
    end
  end
end)

dap.adapters.codelldb = {
  type = 'server',
  port = '6969',
  executable = {
    command = '/usr/bin/codelldb',
    args = { '--port', '6969' },
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
    args = function()
      return coroutine.create(function(dap_run_co)
        vim.ui.input({ prompt = 'Args for executable: ' }, function(choice)
          choice = choice or ''
          local arg = vim.split(choice, ' ')
          coroutine.resume(dap_run_co, arg)
        end)
      end)
    end,
    runInTerminal = false,
  },
}

dap_ui.setup({})
