" enable diagnostics everywhere
autocmd BufEnter * lua require'diagnostic'.on_attach()
" update diagnostics after leaving insert mode
let g:diagnostic_insert_delay = 1
