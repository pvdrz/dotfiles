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

" Set Airline theme
let g:airline_theme='dracula' 
" Use powerline fonts in Airline
let g:airline_powerline_fonts = 1 
" Show tab bar
let g:airline#extensions#tabline#enabled = 1 
" Exclude buffers by name
let g:airline#extensions#tabline#excludes = [] 

" -------------
" Line settings
" -------------

" Enable line number
set number 
" Highlight current line
set cursorline 
