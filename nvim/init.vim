call plug#begin('~/.local/share/nvim/plugged')

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

" Surround Parentheses
Plug 'tpope/vim-surround' 
" Comment blocks
Plug 'scrooloose/nerdcommenter' 
 
" ----------------
" Projects Plugins
" ----------------

" Explore directories
Plug 'justinmk/vim-dirvish'
" Show git changes
Plug 'airblade/vim-gitgutter' 

" ----------
" Completion
" ----------

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}

call plug#end()

" -------------------
" Coc.nvim extensions
" -------------------
let g:coc_global_extensions = ['coc-pairs', 'coc-rls', 'coc-pyls', 'coc-json']

source $HOME/.config/nvim/edit.vim
source $HOME/.config/nvim/look.vim
