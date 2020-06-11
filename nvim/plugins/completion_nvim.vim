" enable completion on every buffer
autocmd BufEnter * lua require'completion'.on_attach()
" limit completion suggestions to 20
let g:completion_max_items = 20
" disable auto signature help
let g:completion_enable_auto_signature = 0
" set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" avoid showing message extra message when using completion
set shortmess+=c
