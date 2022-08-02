local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require 'lspconfig'

lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            rustcSource = "discover",
            cargo = {
                loadOutDirsFromCheck = true,
                allFeatures = true,
                runBuildScripts = true,
            },
            procMacro = {
                enable = true,
            },
            completion = {
                snippets = {
                    some = {
                        postfix = "some",
                        body = "Some(${receiver})",
                        scope = "expr",
                    },
                    ok = {
                        postfix = "ok",
                        body = "Ok(${receiver})",
                        scope = "expr",
                    },
                    err = {
                        postfix = "err",
                        body = "Err(${receiver})",
                        scope = "expr",
                    },
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

lspconfig.clangd.setup({})

lspconfig.pylsp.setup({})
