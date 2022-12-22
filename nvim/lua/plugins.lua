local packer = require('packer')

return packer.startup(function(use) 
    use 'wbthomason/packer.nvim'
    use 'justinmk/vim-dirvish'
    use {
        'neovim/nvim-lspconfig',
        config = function() require('config.nvim-lspconfig') end,
        after = 'nvim-cmp',
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { 
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            },
        config = function() require('config.telescope-nvim') end,
    }
    use {
        'hrsh7th/nvim-cmp',
        config = function() require('config.nvim-cmp') end,
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'windwp/nvim-autopairs',
        },
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('config.nvim-treesitter') end,
    }
    use {
        'navarasu/onedark.nvim',
        config = function() require('config.onedark-nvim') end,
    }
    use 'machakann/vim-sandwich'
    use {
        'windwp/nvim-autopairs',
        config = function() require('config.nvim-autopairs') end,	
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('config.gitsigns-nvim') end,
    }
    use {
        'cespare/vim-toml',
        branch = 'main',
    }
    use {
        'preservim/nerdcommenter',
        config = function() require('config.nerdcommenter') end,
    }
    use 'wsdjeg/vim-fetch'
    use 'sitiom/nvim-numbertoggle'
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('config.lualine-nvim') end,
    }
    use {
        'mrded/nvim-lsp-notify',
        config = function() require('config.nvim-lsp-notify') end,
        requires = {
            'rcarriga/nvim-notify',
        }
    }
    use { 
        'rcarriga/nvim-dap-ui', 
        config = function() require('config.nvim-dap') end,
        requires = {
            'mfussenegger/nvim-dap',
        }
    }
    use {
        'akinsho/toggleterm.nvim',
        config = function() require('config.toggleterm-nvim') end,
    }
    use {
        'romgrk/barbar.nvim',
        config = function() require('config.barbar-nvim') end,
    }
end)
