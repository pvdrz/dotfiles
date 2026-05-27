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
for _, prefix in ipairs({ "", "2-", "3-", "4-" }) do
  local lhs = "<" .. prefix .. "MiddleMouse>"
  vim.keymap.set("", lhs, "<Nop>", {})
end

-- set termguicolors
vim.o.termguicolors = true
-- show line numbers
vim.o.number = true

-- hide buffers instead of closing them
vim.o.hidden = true
-- no backup files
vim.o.backup = false
-- no swap files
vim.o.swapfile = false
-- close preview/scratch window
vim.o.completeopt = "menuone,noselect"
-- enable mouse
vim.o.mouse = "a"
-- enable system clipboard
vim.o.clipboard = "unnamedplus"


local function set_tabsize(tabsize, set_fn)
  for _, name in pairs({ "tabstop", "softtabstop", "shiftwidth" }) do
    set_fn(name, tabsize)
  end
end

-- set default tabsize
set_tabsize(4, function(option, value)
  vim.o[option] = value
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
    end,
  })
end

-- expand tabs with spaces
vim.o.expandtab = true
-- adjust to the next indentation level
vim.o.smarttab = true

-- disable netrw
-- vim.o.loaded_netrwPlugin = 1


-- set *.typ filetype to typst
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.typ",
  callback = function()
    vim.schedule(function()
      vim.bo.filetype = "typst"
    end)
  end,
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
    end,
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup({})
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts_utils = require("nvim-treesitter.ts_utils")

      vim.keymap.set("n", "<leader>tn", function()
        ts_utils.goto_node(ts_utils.get_next_node(ts_utils.get_node_at_cursor(), false, false))
      end)
      vim.keymap.set("n", "<leader>tp", function()
        ts_utils.goto_node(ts_utils.get_previous_node(ts_utils.get_node_at_cursor(), false, false))
      end)

      require("nvim-treesitter.configs").setup({
        ensure_installed = { "rust", "lua", "c", "typst", "python" },
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require("gitsigns")

      vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk)
      vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)
      vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk)
      vim.keymap.set("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end)
      vim.keymap.set("n", "<leader>hn", gitsigns.next_hunk)

      gitsigns.setup({})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end)
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath("config")
                and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using (most
              -- likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
              -- Tell the language server how to find Lua modules same way as Neovim
              -- (see `:h lua-module-load`)
              path = {
                "lua/?.lua",
                "lua/?/init.lua",
              },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
                vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
              },
              -- Or pull in all of 'runtimepath'.
              -- NOTE: this is a lot slower and will cause issues when working on
              -- your own configuration.
              -- See https://github.com/neovim/nvim-lspconfig/issues/3189
              -- library = vim.api.nvim_get_runtime_file('', true),
            },
          })
        end,
        settings = {
          Lua = {},
        },
      })
      vim.lsp.enable("lua_ls")

      vim.lsp.config("rust_analyzer", { capabilities = capabilities })
      vim.lsp.enable("rust_analyzer")

      vim.lsp.enable("tinymist")

      vim.lsp.enable("pylsp")

      vim.lsp.config("ocamllsp", {
        settings = {
          ocamlformat = "ocamlformat",
        },
      })
      vim.lsp.enable("ocamllsp")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    -- commit = "a4ed825",
    tag = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<space>f", builtin.find_files)
      vim.keymap.set("n", "<space>b", function()
        builtin.buffers({ sort_mru = true })
      end)
      vim.keymap.set("n", "<space>D", builtin.diagnostics)
      vim.keymap.set("n", "<space>d", function()
        builtin.diagnostics({ bufnr = 0 })
      end)
      vim.keymap.set("n", "<space>l", builtin.live_grep)

      vim.keymap.set("n", "gd", builtin.lsp_definitions)
      vim.keymap.set("n", "gt", builtin.lsp_type_definitions)
      vim.keymap.set("n", "gi", builtin.lsp_implementations)
      vim.keymap.set("n", "gr", builtin.lsp_references)

      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
        },
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      opleader = {
        mappings = {
          basic = false,
          extra = false,
        },
      },
    },
    config = function()
      local api = require("Comment.api")
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

      vim.keymap.set("n", "<leader>c", api.toggle.linewise.current)
      vim.keymap.set("x", "<leader>c", function()
        vim.api.nvim_feedkeys(esc, "nx", false)
        api.toggle.linewise(vim.fn.visualmode())
      end)
    end,
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
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
          { name = "buffer" },
        }),
      })
    end,
  },
})
