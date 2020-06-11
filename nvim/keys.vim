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
noremap <silent> <leader>d <cmd>lua vim.lsp.buf.definition()<CR>
noremap <silent> <leader>t <cmd>lua vim.lsp.buf.type_definition()<CR>
noremap <silent> <leader>r <cmd>lua vim.lsp.buf.references()<CR>
noremap <silent> <leader>m <cmd>lua vim.lsp.buf.hover()<CR>
noremap <silent> <leader>d <cmd>lua vim.lsp.buf.definition()<CR>

" ---------------
" lsp diagnostics
" ---------------
noremap <silent> <leader>e <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
noremap <silent> <leader>n <cmd>NextDiagnosticCycle<CR>
noremap <silent> <leader>p <cmd>PrevDiagnosticCycle<CR>

" ----------
" completion
" ----------
" use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ---------
" navigation
" ----------
" move to next/previous buffer
noremap <A-Right> :bn<CR>
noremap <A-Left> :bp<CR>
" move to the upper/lower split
noremap <A-Up> <C-w><Up>
noremap <A-Down> <C-w><Down>

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
