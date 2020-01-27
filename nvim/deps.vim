call plug#begin(stdpath('data') . '/plugged')

Plug 'justinmk/vim-dirvish'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'machakann/vim-sandwich'
Plug 'cohama/lexima.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'nelstrom/vim-visual-star-search'

call plug#end()
