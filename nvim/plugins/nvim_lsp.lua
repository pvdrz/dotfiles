require'nvim_lsp'.rust_analyzer.setup({
    capabilities = {
      textDocument = {        completion = {

            completionItem = {
                snippetSupport = false
            }
        }
    }
}
})
