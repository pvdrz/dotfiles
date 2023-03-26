local dap = require('dap')
local widgets = require('dap.ui.widgets')
local telescope = require('telescope')

telescope.load_extension('dap')

-- key bindings
local opts = { noremap = true, silent = true }
-- toggle breakpoint
vim.keymap.set('n', '\\b', dap.toggle_breakpoint, opts)
-- continue
vim.keymap.set('n', '\\c', function() dap.continue() end, opts)
-- show scopes
vim.keymap.set('n', '\\s', function() widgets.centered_float(widgets.scopes) end, opts)
-- show frames 
vim.keymap.set('n', '\\f', telescope.extensions.dap.frames, opts)
-- list breakpoints
vim.keymap.set('n', '\\l', telescope.extensions.dap.list_breakpoints, opts)
-- toggle REPL
vim.keymap.set('', '<F4>', function() dap.repl.toggle({height = 10}) end, opts)
vim.keymap.set('t', '<F4>', '<C-\\><C-n>:lua require("dap").repl.toggle({height = 10})<CR>', { noremap = true })

dap.adapters.codelldb = {
  type = 'server',
  port = '6969',
  executable = {
    command = '/usr/bin/codelldb',
    args = { '--port', '6969' },
  }
}

local input = {}

local function get_input()
  if input.program == nil and input.args == nil then
    return vim.ui.input({
      prompt = 'Executable with args: ',
      default = vim.fn.getcwd() .. '/target/debug/',
      completion = 'file'
    }, function(output)
      local args = vim.split(output or '', ' ')
      local program = table.remove(args, 1)
      input = { program = program, args = args }
    end)
  end
end

dap.configurations.rust = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      get_input()
      local program = input.program
      input.program = nil
      return program
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = function()
      get_input()
      local args = input.args
      input.args = nil
      return args
    end,
    runInTerminal = false,
  },
}
-- open the terminal window in a new tab
dap.defaults.fallback.terminal_win_cmd = 'tabnew'
