" Language Server
let g:LanguageClient_serverCommands['python'] =  ['pyls']
let g:ale_linters['python'] = ['pyls']
let g:ale_fixers['python'] = ['add_blank_lines_for_python_control_statements', 'isort', 'remove_trailing_lines', 'trim_whitespace', 'yapf']
