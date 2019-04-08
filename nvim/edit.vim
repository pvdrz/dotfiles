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
map <F3> <plug>NERDCommenterToggle


" ------------------------
" Language Server Protocol
" ------------------------

" No virtual text
let g:lsp_virtual_text_enabled = 0
" show diagnostics on statusline
let g:lsp_diagnostics_echo_cursor = 1 
" Delay code completion popup
let g:asyncomplete_popup_delay = 300
" Goto definition
nnoremap <silent> gd :LspDefinition<CR>
" Goto type definition
nnoremap <silent> gt :LspTypeDefinition<CR>
" Goto next error
nnoremap <silent> gn :LspNextError<CR>
" Goto previous error
nnoremap <silent> gp :LspPreviousError<CR>


" ---------- 
" Completion
" ----------

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

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
" Do not wrap lines
set nowrap 
