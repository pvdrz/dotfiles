" enable true colors
set termguicolors
" show tabline
set showtabline=2
" set theme
colorscheme nord
" set line numbers to relative so numbertoggle works as intended
set number relativenumber
" highlight current line
set cursorline
" wrap lines for quickfix list
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END
