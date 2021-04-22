vim.cmd 'packadd packer.nvim'
vim.api.nvim_command('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'justinmk/vim-dirvish'
    use {
        'itchyny/lightline.vim',
        config = function() require('plugins.lightline') end
    }
    use 'mengelbrecht/lightline-bufferline'
    use {
        'neovim/nvim-lspconfig',
        config = function() require('plugins.nvim-lspconfig') end
    }
    use {
        'hrsh7th/nvim-compe',
        config = function() require('plugins.nvim-compe') end
    }
    use 'romainl/vim-qf'
    use {
        'pineapplegiant/spaceduck',
 	    branch = 'main',
    }
    use 'jeffkreeftmeijer/vim-numbertoggle'
    use 'machakann/vim-sandwich'
    use {
        'cohama/lexima.vim',
        config = function() require('plugins.lexima') end
    }
    use 'bronson/vim-trailing-whitespace'
    use {
        'preservim/nerdcommenter',
        config = function() require('plugins.nerdcommenter') end
    }
    use {
        'airblade/vim-gitgutter',
        config = function() require('plugins.gitgutter') end
    }
    use 'nelstrom/vim-visual-star-search'
    use 'cespare/vim-toml'
    use 'elixir-editors/vim-elixir'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('plugins.nvim-treesitter') end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        }
    }
    use 'hrsh7th/vim-vsnip'
    use 'ziglang/zig.vim'
    use {
        'voldikss/vim-floaterm',
        config = function() require('plugins.vim-floaterm') end
    }
end)
