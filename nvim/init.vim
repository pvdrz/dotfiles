call plug#begin('~/.local/share/nvim/plugged')

" Themes
Plug 'dracula/vim' " Dracula theme
Plug 'vim-airline/vim-airline' " Cool status bar
Plug 'vim-airline/vim-airline-themes' " Themes for status bar
Plug 'justinmk/vim-dirvish'

" Edition Plugins
Plug 'jiangmiao/auto-pairs' " Auto Pair 
Plug 'alvan/vim-closetag' " Auto Close Tags
Plug 'tpope/vim-surround' " Surround Parentheses
Plug 'ervandew/supertab' " Tab Completion
Plug 'scrooloose/nerdcommenter' " Comment blocks

" Coding Plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocompletion
Plug 'w0rp/ale' " Lint

" Python Plugins
Plug 'zchee/deoplete-jedi' " Python Autocompletion

" Go Plugins
Plug 'zchee/deoplete-go', { 'do': 'make'} "Go Autocompletion
Plug 'fatih/vim-go' "Go plugin

" Javascript Plugins
Plug 'pangloss/vim-javascript' "JS Plugin
Plug 'mxw/vim-jsx' "JSX Plugin
Plug 'carlitux/deoplete-ternjs' "Tern Autocomplete

" Rust Plugins
Plug 'rust-lang/rust.vim' " Rust Plugin
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do':':UpdateRemotePlugins'} " RLS

" Elixir Plugins
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Toml Plugins
Plug 'cespare/vim-toml'

" Haskell Plugins
Plug 'eagletmt/neco-ghc' 

" Git Diff
Plug 'airblade/vim-gitgutter'

call plug#end()

" Tab stuff
set ts=4
set shiftwidth=4
set expandtab
set smarttab
set tw=79
set colorcolumn=79

" Close Preview/Scratch window
set completeopt-=preview

" Enable line number
set number

" Highlight current line
set cursorline

" Highlight matching parentheses
set showmatch 

set nobackup
set noswapfile

" Move automagically to next lines
set whichwrap+=<,>,[,]

" Alt Arrows move between buffers
set hidden
map <A-Left> :bp<CR>
map <A-Right> :bn<CR>

" Set Theme
syntax on
colorscheme dracula 
set termguicolors

" Set Theme for status bar
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1

" Add Tab Bar
let g:airline#extensions#tabline#enabled = 1

" Enable deoplete autocompletion
let g:deoplete#enable_at_startup = 1

" Fix JSX colorscheme for closing tags
hi link xmlEndTag xmlTag

 " Auto Close Tags with extensions
let g:closetag_filenames = '*.html, *.js, *.jsx'

" Use two spaces instead of 4 in JS and HTML
autocmd Filetype javascript setlocal ts=2 shiftwidth=2
autocmd Filetype html setlocal ts=2 shiftwidth=2

" Completion list up to down
let g:SuperTabDefaultCompletionType = "<c-n>"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Comment in blocks
let g:NERDDefaultAlign = 'left'

" Toggle comments
map <F3> <plug>NERDCommenterToggle 

" Enable mouse
set mouse=a

" Clipboard
set clipboard+=unnamedplus

" Enable Linting on Status Bar
let g:airline#extensions#ale#enabled = 1

" Always show linting column
let g:ale_sign_column_always = 1
 
" Linters 
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'python': ['pycodestyle'],
\ 'rust': ['rls']
\}

" Remove trailing whitespaces
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.rs %s/\s\+$//e

" Python Config
let g:deoplete#sources#jedi#python_path='/usr/bin/python3'

" LanguageClient Config
let g:LanguageClient_serverCommands = {
\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
\}

let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> gd :call LanguageClient_textDocument_definition()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()

" Update time
set updatetime=100
