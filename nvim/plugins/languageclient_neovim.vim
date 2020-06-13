" no virtual text
let g:LanguageClient_useVirtualText = "No"
" no signs
let g:LanguageClient_diagnosticsSignsMax = 0
" set language servers
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands.rust = ["rust-analyzer"]
let g:LanguageClient_serverCommands.elixir = ["elixir-ls"]
" use underline highlight for diagnostics
let g:LanguageClient_diagnosticsDisplay = {}
let g:LanguageClient_diagnosticsDisplay.1 = {"name": "Error", "texthl": "Underlined"}
let g:LanguageClient_diagnosticsDisplay.2 = {"name": "Warning", "texthl": "Underlined"}
let g:LanguageClient_diagnosticsDisplay.3 = {"name": "Information", "texthl": "Underlined"}
let g:LanguageClient_diagnosticsDisplay.4 = {"name": "Hint", "texthl": "Underlined"}
