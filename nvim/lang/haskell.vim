let g:ale_linters['haskell'] = ['stack-ghc']
let g:ale_fixers['haskell'] = ['brittany', 'remove_trailing_lines', 'trim_whitespace']
let g:repl_cmd['haskell'] = 'stack ghci'
