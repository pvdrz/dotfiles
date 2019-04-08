call plug#begin("~/.local/share/nvim/plugged")

" ------
" Themes
" ------

" Dracula theme
Plug 'dracula/vim'
" Cool status bar
Plug 'vim-airline/vim-airline' 
" Themes for status bar
Plug 'vim-airline/vim-airline-themes' 


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
Plug 'prabirshrestha/asyncomplete.vim'
" LSP client 
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'


" ----------------
" Projects Plugins
" ----------------

" Explore directories
Plug 'justinmk/vim-dirvish'
" Show git changes
Plug 'airblade/vim-gitgutter' 

call plug#end()

source $HOME/.config/nvim/edit.vim
source $HOME/.config/nvim/look.vim
source $HOME/.config/nvim/lang/rust.vim
source $HOME/.config/nvim/lang/python.vim
