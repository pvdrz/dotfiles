-- no virtual text
vim.api.nvim_set_var("LanguageClient_useVirtualText", "No")
-- no signs
vim.api.nvim_set_var("LanguageClient_diagnosticsSignsMax", 0)
-- set language servers
vim.api.nvim_set_var("LanguageClient_serverCommands", {
    -- rust = {"rust-analyzer", "--logfile=/home/christian/ra.log"},
    rust = {"rustup", "run", "stable", "rls"},
    elixir = {"elixir-ls"},
})
-- use underline highlight for diagnostics
vim.api.nvim_set_var("LanguageClient_diagnosticsDisplay", {
    [1] = {name = "Error", texthl = "LSPDiagnosticsError"},
    [2] = {name = "Warning", texthl = "LSPDiagnosticsWarning"},
    [3] = {name = "Information", texthl = "LSPDiagnosticsInformation"},
    [4] = {name = "Hint", texthl = "LSPDiagnosticsHint"},
})
