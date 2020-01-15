if executable("rls")
    let g:LanguageClient_serverCommands["rust"] = ["rls"]
    autocmd BufWritePre *.rs :call FormatFile(["/Workspace/contrib/"])
elseif executable("ra_lsp_server")
    let g:LanguageClient_serverCommands["rust"] = ["ra_lsp_server"]
    autocmd BufWritePre *.rs :call FormatFile(["/Workspace/contrib/"])
endif
