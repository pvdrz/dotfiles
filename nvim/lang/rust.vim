if executable("rls")
    let g:LanguageClient_serverCommands["rust"] = ["rls"]
    autocmd BufWritePre *.rs :call FormatFile(["/Workspace/contrib/"])
endif
