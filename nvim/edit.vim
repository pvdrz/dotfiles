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
let g:NERDDefaultAlign = 'left'
" Toggle comments 
map <F3> <plug>NERDCommenterToggle

" ------------------------
" Language Server Protocol
" ------------------------

" Goto definition
" Goto type definition
" Go to next diagnostic
" Go to prev diagnostic
" Show diagnostic info
" Highlight symbol under cursor on CursorHold

" ---------- 
" Completion
" ----------

" Use tab for trigger completion with characters ahead and navigate.
" Use enter to confirm completion

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
