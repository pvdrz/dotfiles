call plug#begin('~/.local/share/nvim/plugged')

" Themes
Plug 'dracula/vim' " Dracula theme
Plug 'vim-airline/vim-airline' " Cool status bar
Plug 'vim-airline/vim-airline-themes' " Themes for status bar

" Edition Plugins
Plug 'jiangmiao/auto-pairs' " Auto Pair 
Plug 'tpope/vim-surround' " Surround Parentheses
Plug 'scrooloose/nerdcommenter' " Comment blocks
 
" Projects Plugins
Plug 'justinmk/vim-dirvish' " Explore directories
Plug 'airblade/vim-gitgutter' " Show git changes
 
" Language Server
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
 
" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Linting
Plug 'w0rp/ale'

" Text Search
Plug 'jremmen/vim-ripgrep'

" Specific Languages

" Elixir
Plug 'slashmili/alchemist.vim' " Autocompletion
Plug 'elixir-editors/vim-elixir' " Syntax highlighting
Plug 'tpope/vim-endwise' " Add end automatically

" Haskell
Plug 'eagletmt/neco-ghc' " Autocompletion

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

source $HOME/.config/nvim/edit.vim
source $HOME/.config/nvim/look.vim
source $HOME/.config/nvim/repl.vim

" Language specific configuration

source $HOME/.config/nvim/lang/elixir.vim
source $HOME/.config/nvim/lang/haskell.vim
source $HOME/.config/nvim/lang/pandoc.vim
source $HOME/.config/nvim/lang/python.vim
source $HOME/.config/nvim/lang/rust.vim
source $HOME/.config/nvim/lang/typescript.vim


