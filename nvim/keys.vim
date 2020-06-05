" remap leader
let mapleader=","
" remap U to u
noremap U u
" remap :W to :w
command! -bar -nargs=* -complete=file -range=% -bang W <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq <line1>,<line2>wq<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang WQ <line1>,<line2>wq<bang> <args>
" unmap s
map s <nop>
" toggle comments
map <F3> <Plug>NERDCommenterToggle
" call formatting
nnoremap <F5> :call LanguageClient#textDocument_formatting_sync()<CR>

" ----------------
" lsp key mappings
" ----------------
nmap <leader>d :call LanguageClient#textDocument_definition()<CR>
nmap <leader>t :call LanguageClient#textDocument_typeDefinition()<CR>
nmap <leader>r :call LanguageClient_textDocument_references()<CR>
nmap <leader>m :call LanguageClient_textDocument_hover()<CR>

" ---------
" navigation
" ----------
" move to next/previous buffer
noremap <A-Right> :bn<CR>
noremap <A-Left> :bp<CR>
" move to next/previous git change
nmap <leader>c <Plug>(GitGutterNextHunk)
nmap <leader>C <Plug>(GitGutterPrevHunk)

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

" ------
" splits
" ------
" toggle quickfix
nmap <F4> <Plug>(qf_qf_toggle)
" move to the upper split
noremap <A-Up> <C-w><Up>
" move to the lower split
noremap <A-Down> <C-w><Down>
