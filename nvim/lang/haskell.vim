if executable("hie-wrapper")
    let g:LanguageClient_serverCommands["haskell"] = ["hie-wrapper"]
endif

