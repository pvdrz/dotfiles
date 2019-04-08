if executable("rls")
    let g:LanguageClient_serverCommands["rust"] = ["rls"]
    autocmd BufWritePre *.rs :call LanguageClient#textDocument_formatting_sync()
endif
