call plug#begin("~/.local/share/nvim/plugged")

" ------
" Themes
" ------

" Dracula theme
Plug 'dracula/vim'
" Cool status bar
Plug 'vim-airline/vim-airline'


" ---------------
" Edition Plugins
" ---------------

" Surround parentheses
Plug 'tpope/vim-surround'
" Auto close parentheses
Plug 'jiangmiao/auto-pairs'
" Comment blocks
Plug 'scrooloose/nerdcommenter'
" Code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Use tab for code completion
Plug 'ervandew/supertab'
" LSP client
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
" Highlighting for f<char>
Plug 'unblevable/quick-scope'
" Manage whitespaces
Plug 'ntpeters/vim-better-whitespace'
" Toggle relative/absolute line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'


" ----------------
" Projects Plugins
" ----------------

" Explore directories
Plug 'justinmk/vim-dirvish'
" Show git changes
Plug 'airblade/vim-gitgutter'
" Managing the quickfix window
Plug 'romainl/vim-qf'


" -----
" Rust
" -----

Plug 'rust-lang/rust.vim'

" -----
" Latex
" -----

Plug 'lervag/vimtex'

" -----
" Haskell
" -----

Plug 'neovimhaskell/haskell-vim'

" --------
" Markdown
" --------

Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

source $HOME/.config/nvim/edit.vim
source $HOME/.config/nvim/look.vim

for lang in split(globpath("$HOME/.config/nvim/lang/", "*"), "\n")
    exe "source" lang
endfor
