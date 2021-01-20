-- no virtual text
vim.api.nvim_set_var("LanguageClient_useVirtualText", "No")
-- no signs
vim.api.nvim_set_var("LanguageClient_diagnosticsSignsMax", 0)
-- set language servers
vim.api.nvim_set_var("LanguageClient_serverCommands", {
    rust = {"rust-analyzer"},
    elixir = {"elixir-ls"},
    tex = {"texlab"},
})

vim.api.nvim_set_var("LanguageClient_settingsPath", "/home/christian/.config/nvim/settings.json")

vim.api.nvim_set_var("LanguageClient_rootMarkers", {
    elixir = {"mix.exs"},
})
