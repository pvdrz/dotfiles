require'nvim_lsp'.rust_analyzer.setup({
    capabilities = {
      textDocument = {
          completion = {
            completionItem = {
                snippetSupport = false
            }
        }
    }
}})

require'nvim_lsp'.elixirls.setup({
    cmd = { "elixir-ls" },
    capabilities = {
      textDocument = {
          completion = {
            completionItem = {
                snippetSupport = false
            }
        }
    }
}})
