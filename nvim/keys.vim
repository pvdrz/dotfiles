" remap leader
let mapleader=","

" ---------
" navigation
" ----------
" move to previous buffer
noremap <A-Left> :bp<CR>
" move to next buffer
noremap <A-Right> :bn<CR>

" -------
" edition
" -------
" insert line without entering insert mode
nnoremap o o<Esc>
nnoremap O O<Esc>
" use blackhole register for the next action
map <leader>b "_
" use backspace to delete to blackhole register
map <BS> "_d

" call formatting
nnoremap <F5> :call LanguageClient#textDocument_formatting_sync()<CR>
