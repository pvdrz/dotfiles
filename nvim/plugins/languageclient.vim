" set language servers
let g:LanguageClient_serverCommands = {}
" no virtual text
let g:LanguageClient_useVirtualText = "No"
" no signs
let g:LanguageClient_diagnosticsSignsMax = 0

let g:LanguageClient_serverCommands.rust = ["rls"]
let g:LanguageClient_serverCommands.python = ["pyls"]
let g:LanguageClient_serverCommands.haskell = ['hie-wrapper', '--lsp']
