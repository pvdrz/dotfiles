if executable("hie-wrapper")
    let g:LanguageClient_serverCommands["haskell"] = ["hie-wrapper"]
    autocmd BufWritePre *.hs :call LanguageClient#textDocument_formatting_sync()
endif

