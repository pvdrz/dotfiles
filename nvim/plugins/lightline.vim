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
