" ---------------
" Syntax settings
" ---------------

" Enable color syntax
syntax on
" Highlight matching parentheses
set showmatch


" -----
" Theme
" -----

" Set theme
colorscheme dracula
" True colors
set termguicolors


" ----------------
" Airline settings
" ----------------

" Use powerline fonts in Airline
let g:airline_powerline_fonts = 1
" Show tab bar
let g:airline#extensions#tabline#enabled = 1


" -------------
" Line settings
" -------------

" Enable line number
set number
" Highlight current line
set cursorline

" ---
" Git
" ---

" Never show sign column
set signcolumn=no
" Set gitgutter highlights for line number
highlight link GitGutterAddLineNr DiffAdd
highlight link GitGutterChangeLineNr DiffChange
highlight link GitGutterDeleteLineNr DiffDelete
highlight link GitGutterChangeDeleteLineNr DiffChange
" Use highlighting of git changes only in line numbers
let g:gitgutter_highlight_linenrs = 1
