" never show sign column
set signcolumn=no
" set gitgutter highlights for line number
highlight link GitGutterAddLineNr DiffAdd
highlight link GitGutterChangeLineNr DiffChange
highlight link GitGutterDeleteLineNr DiffDelete
highlight link GitGutterChangeDeleteLineNr DiffChange
" use highlighting of git changes only in line numbers
let g:gitgutter_highlight_linenrs = 1
" do not load key mappings
let g:gitgutter_map_keys = 0
