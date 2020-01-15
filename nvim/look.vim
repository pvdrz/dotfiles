" enable true colors
set termguicolors
" show tabline
set showtabline=2
" set theme
colorscheme challenger_deep
" set line numbers to relative so numbertoggle works as intended
set number relativenumber
" highlight current line
set cursorline

" ---------
" lightline
" ---------
let g:lightline = {}
" set theme
let g:lightline.colorscheme = "challenger_deep"
" use angled separators
let g:lightline.separator = { "left": "", "right": "" }
let g:lightline.subseparator = { "left": "", "right": "" }
" use tabline to show buffers
let g:lightline.tabline = {"left": [["buffers"]], "right": []}
let g:lightline.component_expand = {"buffers": "lightline#bufferline#buffers"}
let g:lightline.component_type = {"buffers": "tabsel"}
