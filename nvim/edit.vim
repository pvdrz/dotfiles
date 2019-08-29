" ---------------
" Custom Mappings
" ---------------

" Blackhole register
map b "_
" Esc is too far
inoremap jj <Esc>
" Insert line without entering insert mode
nnoremap o o<Esc>
nnoremap O O<Esc>
" Remap leader
let mapleader=","


" ------------
" Tab settings
" ------------

" Number of spaces for tab
set ts=4
" Number of spaces for reindent
set shiftwidth=4
" Spaces instead of tabs
set expandtab
" Adjust to the next indentation level
set smarttab


" ---------------
" Buffer settings
" ---------------

" Hide buffers instead of closing them
set hidden
" Move to previous buffer
noremap <A-Left> :bp<CR>
" Move to next buffer
noremap <A-Right> :bn<CR>
" Move to below split
noremap <A-Down> <C-W><C-J>
" Move to above split
noremap <A-Up> <C-W><C-K>


" -----------------
" Comments settings
" -----------------

" Add spaces after comment delimiters
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1
" Comment in blocks
let g:NERDDefaultAlign = "left"
" Toggle comments
map <F3> <Plug>NERDCommenterToggle

" ---------------
" Search settings
" ---------------

" Do incremental search
set incsearch
" Use ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
" Binding for using grep
nnoremap <leader>g :silent grep!<Space>


" ------------------------
" Language Server Protocol
" ------------------------

" Empty dictionary for servers
let g:LanguageClient_serverCommands = {}
" No virtual text
let g:LanguageClient_useVirtualText = 0
" Goto definition
nmap <leader>d :call LanguageClient#textDocument_definition()<CR>
" Goto type definition
nmap <leader>t :call LanguageClient#textDocument_typeDefinition()<CR>
" Use location list for diagnostics
let g:LanguageClient_diagnosticsList = "Location"
" Function to blacklist formatting
function FormatFile(blacklist)
    let pwd = expand("%:p")
    for path in a:blacklist
        if pwd =~ path
            return 0
        endif
    endfor
    call LanguageClient#textDocument_formatting_sync()
    return 1
endfunction


" --------
" Quickfix
" --------

" Goto next location item
nmap <leader>n <Plug>(qf_loc_next)
" Goto previous location item
nmap <leader>p <Plug>(qf_loc_previous)
" Toggle location window
nmap <F1> <Plug>(qf_loc_toggle)
" Toggle quickfix window
nmap <F2> <Plug>(qf_qf_toggle)


" ----------
" Completion
" ----------

" Enable deoplete
let g:deoplete#enable_at_startup = 1
" Navigate completions from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"


" --------------------
" Whitespace managment
" --------------------

" Highlight trailingwhitespaces
let g:better_whitespace_enabled=1
" Remove trailing whitespaces on save
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" ----
" Undo
" ----

" Maintain undo history between sessions
set undofile
" keep undofiles under the same directory
set undodir=~/.undodir


" ------
" Others
" ------

" No backup files
set nobackup
" No swap files
set noswapfile
" Close Preview/Scratch window
set completeopt-=preview
" Time to check if file changed
set updatetime=100
" Enable mouse
set mouse=a
" Enable system clipboard
set clipboard+=unnamedplus
" Wrap left and right to next line
set whichwrap+=<,>,[,]
" Keep cursor still
set nostartofline
