" hide buffers instead of closing them
set hidden
" no backup files
set nobackup
" no swap files
set noswapfile
" close preview/scratch window
set completeopt-=preview
" enable mouse
set mouse=a
" enable system clipboard
set clipboard+=unnamedplus
" wrap left and right to next line
set whichwrap+=<,>,[,]
" delete trailing whitespaces on save
autocmd BufWritePre * :FixWhitespace
" set number of spaces for tab
set ts=4
" set number of spaces for reindent
set shiftwidth=4
" use spaces instead of tabs
set expandtab
" adjust to the next indentation level
set smarttab
