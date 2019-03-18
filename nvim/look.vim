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
" Better display for messages
set cmdheight=1
" Integration with coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" -------------
" Line settings
" -------------

" Enable line number
set number 
" Highlight current line
set cursorline 
