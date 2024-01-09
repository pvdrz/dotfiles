vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_italic = false

-- Load the colorscheme
require('nord').set()

-- Set visual highlight as the underline for diagnostics
local diagnostic_highlight = 'Visual'

for _, level in pairs({ 'Error', 'Hint', 'Info', 'Warn' }) do
  -- FIXME: Do this with the Lua API.
  vim.cmd('highlight! link DiagnosticUnderline' .. level .. ' ' .. diagnostic_highlight)
end

vim.cmd('highlight! link DiagnosticUnnecessary ' .. diagnostic_highlight)
