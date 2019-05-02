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
" Latex
" -----

Plug 'lervag/vimtex'

call plug#end()

source $HOME/.config/nvim/edit.vim
source $HOME/.config/nvim/look.vim
source $HOME/.config/nvim/lang/rust.vim
source $HOME/.config/nvim/lang/python.vim
