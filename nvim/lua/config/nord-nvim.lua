vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_italic = false

-- Load the colorscheme
require('nord').set()

-- Set visual highlight as the underline for diagnostics  
for _, level in pairs({'Error', 'Hint', 'Info', 'Warn'}) do
  -- FIXME: Do this with the Lua API.
  vim.cmd('highlight! link DiagnosticUnderline' .. level .. ' Visual')
end
