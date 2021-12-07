local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require 'lspconfig'

lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            rustcSource = "discover",
            cargo = {
                loadOutDirsFromCheck = true,
                allFeatures = true,
            },
            procMacro = {
                enable = true,
            },
            completion = {
                snippets = {
                    unsafe = {
                        postfix = "unsafe",
                        body = "unsafe { ${receiver} }",
                        scope = "expr",
                    },
                    arc = {
                        postfix = "arc",
                        body = "Arc::new(${receiver})",
                        scope = "expr",
                        requires = "std::sync::Arc",
                    },
                }
            },
        }
    }
})

lspconfig.zls.setup({})

lspconfig.gopls.setup({
    cmd = {'gopls', '--remote=auto'},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

lspconfig.pylsp.setup({})
