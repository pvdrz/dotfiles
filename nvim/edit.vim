" --------
" deoplete
" --------
" enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" ------
" lexima
" ------
" enable basic rules
let g:lexima_enable_basic_rules = 1

" ------
" others
" ------
" hide buffers instead of closing them
set hidden
" no backup files
set nobackup
" no swap files
set noswapfile
" close Preview/Scratch window
set completeopt-=preview
" enable mouse
set mouse=a
" enable system clipboard
set clipboard+=unnamedplus
" wrap left and right to next line
set whichwrap+=<,>,[,]
" delete trailing whitespaces on save
autocmd BufWritePre * :FixWhitespace
