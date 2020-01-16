" set language servers
let g:LanguageClient_serverCommands = {}
" no virtual text
let g:LanguageClient_useVirtualText = "No"
" no signs
let g:LanguageClient_diagnosticsSignsMax = 0

" ----
" rust
" ----
let g:LanguageClient_serverCommands.rust = ["rls"]
