let g:repl_cmd = {} " Dictionary for REPL commands
tnoremap <Esc> <C-\><C-n> |" Exit terminal mode with Esc
let g:airline#extensions#tabline#excludes+=["term://"] 
function Repl()
    let l:cmd = ""
    if has_key(g:repl_cmd, &filetype)
        let l:cmd = g:repl_cmd[&filetype]
    endif
    below 10sp | exec("terminal " . cmd)
    setlocal nonumber
    setlocal nocursorline
    startinsert!
endfunction

command Repl :call Repl()
