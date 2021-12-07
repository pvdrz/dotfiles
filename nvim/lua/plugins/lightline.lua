vim.api.nvim_set_var("lightline", {
  -- set theme
  colorscheme = "nord",
  -- use angled separators
  separator = { left = "", right = " " },
  subseparator = { left =  "", right = " " },
  -- use tabline to show buffers
  tabline = { left = {{"buffers"}}, right =  {} },
  component_expand = { buffers = "lightline#bufferline#buffers" },
  component_type = { buffers = "tabsel" },
})
