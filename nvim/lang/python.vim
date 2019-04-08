if executable("pyls")
    let g:LanguageClient_serverCommands["python"] = ["pyls"]
    autocmd BufWritePre *.py :call LanguageClient#textDocument_formatting_sync()
endif
