require("telescope").setup {
  pickers = {
    -- Default configuration for builtin pickers goes here:
    lsp_type_definitions = {
      jump_type = "never",
      layout_strategy = "vertical",
      layout_config = { scroll_speed = 1, width = 100, preview_height = 0.8 },
    },
    lsp_definitions = {
      jump_type = "never",
      layout_strategy = "vertical",
      layout_config = { scroll_speed = 1, width = 100, preview_height = 0.8 },
    },
    lsp_references = {
      layout_strategy = "vertical",
      layout_config = { scroll_speed = 1, width = 100, preview_height = 0.8 },
    },
    lsp_implementations = {
      layout_strategy = "vertical",
      layout_config = { scroll_speed = 1 },
    },
    diagnostics = {
      layout_strategy = "vertical",
      layout_config = { scroll_speed = 1 },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    }
  }
}
