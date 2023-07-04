local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local settings = require("nlspsettings")

-- ignore logs for now
vim.lsp.set_log_level("off")

-- key bindings
local opts = { noremap = true, silent = true }
-- go to declaration
vim.keymap.set('n', '<leader>D', vim.lsp.buf.declaration, opts)
-- go to definition
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
-- show hover information
vim.keymap.set('n', '<leader>m', vim.lsp.buf.hover, opts)
-- format the current buffer
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
-- rename the current identifier
vim.keymap.set('n', '<leader>c', vim.lsp.buf.rename, opts)
-- show code actions
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)

vim.diagnostic.config({
  -- don't use signs for diagnostics
  signs = false,
  -- don't use underlines for diagnostics
  underline = false,
})

settings.setup({
  config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
  local_settings_dir = '.nlsp-settings',
  local_settings_root_markers_fallback = { '.git' },
  append_default_schemas = true,
  loader = 'json'
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
})

lspconfig.clangd.setup({
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
