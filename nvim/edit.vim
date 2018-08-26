" Tab settings
set ts=4 " Number of spaces for tab
set shiftwidth=4 " Number of spaces for reindent
set expandtab " Spaces instead of tabs
set smarttab " Adjust to the next indentation level

" Buffer settings
set hidden " Hide buffers instead of closing them
noremap <A-Left> :bp<CR>| " Move to previous buffer
noremap <A-Right> :bn<CR>| " Move to next buffer
noremap <A-Down> <C-W><C-J>| "Move to below split
noremap <A-Up> <C-W><C-K>| "Move to above split

" Comments settings
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines
let g:NERDDefaultAlign = 'left' " Comment in blocks
map <F3> <plug>NERDCommenterToggle| " Toggle comments 

" Completion settings
let g:deoplete#enable_at_startup = 1 " Run deoplete at startup

" Linting settings
let g:ale_linters = {} " Dictionary for linters
let g:ale_fixers = {} " Dictionary for fixers
let g:ale_linters_explicit = 1 " Use only specified linters
let g:ale_fix_on_save = 1 " Run fixers on save

" Language server settings
let g:LanguageClient_serverCommands = {} " Dictionary for language servers


" Others
set nobackup " No backup files
set noswapfile " No swap files
set completeopt-=preview " Close Preview/Scratch window
set updatetime=100 " Time to check if file changed
set mouse=a  " Enable mouse
set clipboard+=unnamedplus " Enable system clipboard
set whichwrap+=<,>,[,] " Wrap left and right to next line
set nostartofline " Keep cursor still 
