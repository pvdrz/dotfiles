require('keys')
require('misc')

-- clone lazy.nvim if we don't have it already
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

function cfg(name)
  return function()
    require('config.' .. name)
  end
end

require('lazy').setup({
  {
    'shaunsingh/nord.nvim',
    config = cfg('nord-nvim'),
  },
  'justinmk/vim-dirvish',
  {
    'neovim/nvim-lspconfig',
    config = cfg('nvim-lspconfig'),
    dependencies = {
      'tamago324/nlsp-settings.nvim',
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-dap.nvim',
    },
    config = cfg('telescope-nvim'),
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'windwp/nvim-autopairs',
      'rcarriga/cmp-dap',
    },
    config = cfg('nvim-cmp'),
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = cfg('nvim-treesitter'),
  },
  'machakann/vim-sandwich',
  {
    'windwp/nvim-autopairs',
    config = cfg('nvim-autopairs'),
  },
  {
    'lewis6991/gitsigns.nvim',
    config = cfg('gitsigns-nvim'),
  },
  {
    'cespare/vim-toml',
    branch = 'main',
  },
  {
    'preservim/nerdcommenter',
    config = cfg('nerdcommenter'),
  },
  'wsdjeg/vim-fetch',
  'sitiom/nvim-numbertoggle',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'shaunsingh/nord.nvim',
    },
    config = cfg('lualine-nvim'),
  },
  {
    'mrded/nvim-lsp-notify',
    config = cfg('nvim-lsp-notify'),
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = cfg('nvim-dap'),
  },
  {
    'voldikss/vim-floaterm',
    config = cfg('vim-floaterm'),
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'shaunsingh/nord.nvim',
    },
    config = cfg('bufferline-nvim'),
  }
})
