vim.cmd 'packadd packer.nvim'
vim.api.nvim_command('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'justinmk/vim-dirvish'
    use 'itchyny/lightline.vim'
    use 'mengelbrecht/lightline-bufferline'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'romainl/vim-qf'
    use {
        'dracula/vim',
        as = 'dracula',
    }
    use 'jeffkreeftmeijer/vim-numbertoggle'
    use 'machakann/vim-sandwich'
    use 'cohama/lexima.vim'
    use 'bronson/vim-trailing-whitespace'
    use 'preservim/nerdcommenter'
    use 'airblade/vim-gitgutter'
    use 'nelstrom/vim-visual-star-search'
    use 'cespare/vim-toml'
    use 'elixir-editors/vim-elixir'
    use 'tpope/vim-endwise'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
    use {
	'nvim-telescope/telescope.nvim',
	requires = {
	    {'nvim-lua/popup.nvim'},
	    {'nvim-lua/plenary.nvim'},
	},
    }
end)
