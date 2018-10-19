let g:LanguageClient_serverCommands['typescript.jsx'] = ['typescript-language-server', '--stdio']
let g:ale_linters['typescript.jsx'] = ['tslint']
let g:ale_fixers['typescript.jsx'] = ['tslint', 'remove_trailing_lines', 'trim_whitespace']

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx " set filetypes as typescript.jsx
autocmd Filetype typescript.jsx setlocal ts=2 sw=2 expandtab
highlight link jsxCloseTag jsxTag
