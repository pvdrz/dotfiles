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
        config = function() require('plugins.nvim-lspconfig') end,
        requires = {
            'hrsh7th/cmp-nvim-lsp'
        }
    }
    use {
        'hrsh7th/nvim-cmp',
        config = function() require('plugins.nvim-cmp') end,
        requires = {
            'hrsh7th/cmp-buffer'
        }
    }
    use 'romainl/vim-qf'
    use {
        'arcticicestudio/nord-vim',
        branch = 'main'
    }
    use 'jeffkreeftmeijer/vim-numbertoggle'
    use 'machakann/vim-sandwich'
    use 'cohama/lexima.vim'
    use 'bronson/vim-trailing-whitespace'
    use {
        'preservim/nerdcommenter',
        config = function() require('plugins.nerdcommenter') end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('plugins.gitsigns-nvim') end
    }
    use 'nelstrom/vim-visual-star-search'
    use {
        'cespare/vim-toml',
        branch = 'main'
    }
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
        },
        config = function() require('plugins.telescope') end
    }
    use {
        'hrsh7th/vim-vsnip',
        requires = {
            'hrsh7th/cmp-vsnip',
        }
    }
    use {
        'voldikss/vim-floaterm',
        config = function() require('plugins.vim-floaterm') end
    }
    use 'stevearc/dressing.nvim'
    use 'wsdjeg/vim-fetch'
end)
