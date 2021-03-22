require 'lspconfig'.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            rustcSource = "discover",
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})
