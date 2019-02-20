let g:ale_fixers['latex'] = ['remove_trailing_lines', 'trim_whitespace']

au BufRead,BufNewFile *.tex setlocal textwidth=80

let g:tex_flavor = "latex"
