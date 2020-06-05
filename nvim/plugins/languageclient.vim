" set language servers
let g:LanguageClient_serverCommands = {}
" no virtual text
let g:LanguageClient_useVirtualText = "No"
" no signs
let g:LanguageClient_diagnosticsSignsMax = 0

let g:LanguageClient_serverCommands.rust = ["rust-analyzer"]
let g:LanguageClient_serverCommands.python = ["pyls"]
let g:LanguageClient_serverCommands.elixir = ["$HOME/Workspace/contrib/elixir-ls/release/language_server.sh"]
let g:LanguageClient_serverCommands.haskell = ["haskell-language-server-wrapper", "--lsp"]
