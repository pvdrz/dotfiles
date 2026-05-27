local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- set leader
vim.g.mapleader = ","

-- Don't paste with the middle mouse button
for _, prefix in ipairs({"", "2-", "3-", "4-"}) do
  local lhs = "<" .. prefix .. "MiddleMouse>"
  vim.keymap.set("", lhs, "<Nop>", {})
end

-- set termguicolors
vim.o.termguicolors = true
-- show line numbers
vim.wo.number = true

-- hide buffers instead of closing them
vim.o.hidden = true
-- no backup files
vim.o.backup = false
-- no swap files
vim.o.swapfile = false
-- close preview/scratch window
vim.o.completeopt = "menuone,noselect"
-- enable mouse
vim.api.nvim_set_option("mouse", "a")
-- enable system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")


local function set_tabsize(tabsize, set_fn)
  for _, name in pairs({ "tabstop", "softtabstop", "shiftwidth" }) do
    set_fn(name, tabsize)
  end
end

-- set default tabsize
set_tabsize(4, function(option, value)
  vim.o[option] = value
  vim.bo[option] = value
end)

-- set tabsize to 2 for some languages
local extensions = { "lua", "ex", "exs", "c", "h" }

for _, extension in ipairs(extensions) do
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*." .. extension,
    callback = function()
      set_tabsize(2, function(option, value)
        vim.bo[option] = value
      end)
    end
  })
end

-- expand tabs with spaces
vim.o.expandtab = true
vim.bo.expandtab = true
-- adjust to the next indentation level
vim.o.smarttab = true

-- disable netrw
-- vim.o.loaded_netrwPlugin = 1


-- set *.typ filetype to typst 
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.typ",
  callback = function()
    vim.bo.filetype = "typst"
  end
})

require("lazy").setup({
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  "wsdjeg/vim-fetch",
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function() 
      require("mini.surround").setup({})
    end
  },{
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({})
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts_utils = require("nvim-treesitter.ts_utils")
        
      vim.keymap.set("n", "<leader>tn", function() ts_utils.goto_node(ts_utils.get_next_node(ts_utils.get_node_at_cursor(), false, false)) end)
      vim.keymap.set("n", "<leader>tp", function() ts_utils.goto_node(ts_utils.get_previous_node(ts_utils.get_node_at_cursor(), false, false)) end)

      require("nvim-treesitter.configs").setup({
        ensure_installed = { "rust", "lua", "c", "typst", "python" }, 
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
        }
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function() 
      vim.cmd.colorscheme("catppuccin-mocha")
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require("gitsigns")

      vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk);
      vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk);
      vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk);
      vim.keymap.set("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end);
      vim.keymap.set("n", "<leader>hn", gitsigns.next_hunk);

      gitsigns.setup({})
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration)

      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)

      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
  
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.rust_analyzer.setup({
        on_init = function(client)
          local path = client.workspace_folders[1].name

          if string.find(path, "dnssec") then
            client.config.settings["rust-analyzer"].cargo.features = { "dnssec", "dnssec-ring", "recursor", "sqlite", "resolver", "blocklist" }
          elseif string.find(path, "bindgen") then
            client.config.settings["rust-analyzer"].rustfmt.extraArgs = { "+nightly" }
          elseif string.find(path, "ferrocene/ferrocene") then
            local start_index, end_index = string.find(path, "ferrocene/ferrocene")
            local workspace_path = string.sub(path, 1, end_index)
            client.config.settings["rust-analyzer"].check.invocationStrategy = "once" 
            client.config.settings["rust-analyzer"].check.overrideCommand = { "x.py", "check", "--json-output" }
            client.config.settings["rust-analyzer"].linkedProjects = {
              "Cargo.toml",
              "compiler/rustc_codegen_cranelift/Cargo.toml",
              "compiler/rustc_codegen_gcc/Cargo.toml",
              "library/Cargo.toml",
              "src/bootstrap/Cargo.toml",
              "src/tools/rust-analyzer/Cargo.toml"
            } 

            client.config.settings["rust-analyzer"].rustfmt.overrideCommand = { workspace_path .. "/build/host/rustfmt/bin/rustfmt", "--edition=2021" }
            client.config.settings["rust-analyzer"].procMacro.server = workspace_path .. "/build/host/stage0/libexec/rust-analyzer-proc-macro-srv"
            client.config.settings["rust-analyzer"].procMacro.enable = true
            client.config.settings["rust-analyzer"].cargo.buildScripts.enable = true
            client.config.settings["rust-analyzer"].cargo.buildScripts.invocationStrategy = "once"
            client.config.settings["rust-analyzer"].cargo.buildScripts.overrideCommand = { "x.py", "check", "--json-output" } 
            client.config.settings["rust-analyzer"].cargo.sysrootSrc = "./library"
            client.config.settings["rust-analyzer"].rustc.source = "./Cargo.toml"
            client.config.settings["rust-analyzer"].cargo.extraEnv = { RUSTC_BOOTSTRAP = "1" }
          end
        end,
        settings = {
          ["rust-analyzer"] = {
            check = {
              overrideCommand = {},
            },
            linkedProjects = {},
            cargo = {
              features = {},
              buildScripts = {
                overrideCommand = {},
              },
              extraEnv = {},
            },
            rustfmt = {
              overrideCommand = {},
              extraArgs = {},
            },
            rustc = {},
            procMacro = {},
          }
        },
        { capabilities = capabilities }
      })
      lspconfig.tinymist.setup({ capabilities = capabilities })
      lspconfig.pylsp.setup({ capabilities = capabilities })
      local configs = require("lspconfig.configs")

      local lexical_config = {
        filetypes = { "elixir", "eelixir", "heex" },
        cmd = { "/my/home/projects/_build/dev/package/lexical/bin/start_lexical.sh" },
        settings = {},
      }

      if not configs.lexical then
        configs.lexical = {
          default_config = {
            filetypes = lexical_config.filetypes,
            cmd = lexical_config.cmd,
            root_dir = function(fname)
              return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
            end,
            -- optional settings
            settings = lexical_config.settings,
          },
        }
      end

      lspconfig.lexical.setup({})

      lspconfig.zls.setup({})

      lspconfig.ocamllsp.setup({
        settings = {
          ocamlformat = "ocamlformat",
        }
      })
      end
  },
  {
    "nvim-telescope/telescope.nvim",
    commit = "a4ed825",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<space>f", builtin.find_files)
      vim.keymap.set("n", "<space>b", function() builtin.buffers({ sort_mru = true }) end)
      vim.keymap.set("n", "<space>D", builtin.diagnostics)
      vim.keymap.set("n", "<space>d", function() builtin.diagnostics({ bufnr = 0 }) end )
      vim.keymap.set("n", "<space>l", builtin.live_grep)

      vim.keymap.set("n", "gd", builtin.lsp_definitions)
      vim.keymap.set("n", "gt", builtin.lsp_type_definitions)
      vim.keymap.set("n", "gi", builtin.lsp_implementations)
      vim.keymap.set("n", "gr", builtin.lsp_references)
	
      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
        }
      })
    end
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      opleader = {
        mappings = {
	  basic = false,
	  extra = false,
	}
      }
    },
    config = function()
      local api = require("Comment.api")

      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

      vim.keymap.set("n", "<leader>c", api.toggle.linewise.current)
      vim.keymap.set("x", "<leader>c", function()
	vim.api.nvim_feedkeys(esc, "nx", false)
	api.toggle.linewise(vim.fn.visualmode())
      end)
    end
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
	snippet = {
	  expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
	  end
	},
	mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true })
	}),
	sources = cmp.config.sources({
	  { name = "nvim_lsp"},
	  { name = "vsnip"},
	  { name = "buffer"},
	})
      })
    end
  }
})
