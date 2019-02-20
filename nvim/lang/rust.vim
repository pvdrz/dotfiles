let g:LanguageClient_serverCommands['rust'] = ['rustup', 'run', 'main', 'rls']
let g:ale_linters['rust'] = ['cargo']
let g:ale_fixers['rust'] = ['rustfmt', 'remove_trailing_lines', 'trim_whitespace']
