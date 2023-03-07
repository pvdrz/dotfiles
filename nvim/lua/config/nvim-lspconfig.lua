local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

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

local rust_settings = {
    ['rust-analyzer'] = {
        rustcSource = 'discover',
        cargo = { features = 'all' },
        completion = {
            snippets = {
                some = {
                    postfix = 'some',
                    body = 'Some(${receiver})',
                    scope = 'expr',
                },
                ok = {
                    postfix = 'ok',
                    body = 'Ok(${receiver})',
                    scope = 'expr',
                },
                err = {
                    postfix = 'err',
                    body = 'Err(${receiver})',
                    scope = 'expr',
                },
                unsafe = {
                    postfix = 'unsafe',
                    body = 'unsafe { ${receiver} }',
                    scope = 'expr',
                },
                arc = {
                    postfix = 'arc',
                    body = 'Arc::new(${receiver})',
                    scope = 'expr',
                    requires = 'std::sync::Arc',
                },
                print = {
                    postfix = 'print',
                    body = 'println!("{}", ${receiver});',
                    scope = 'expr',
                },
                debug = {
                    postfix = 'debug',
                    body = 'println!("{:?}", ${receiver});',
                    scope = 'expr',
                },
            }
        }
    }
} 

lspconfig.rust_analyzer.setup({
    on_init = function(client)
        local notify = require('notify')
        local path = client.workspace_folders[1].name

        if string.find(path, 'rust%-bindgen') ~= nil then
            notify('Using bindgen config', 'info', { title = 'LSP' })
            client.config.settings['rust-analyzer'].cargo.features = { 'experimental' }
        end

        client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
        return true
    end, 
    capabilities = capabilities,
    settings = rust_settings,
})

lspconfig.clangd.setup({})
