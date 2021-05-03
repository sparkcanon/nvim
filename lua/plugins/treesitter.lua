require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true -- false will disable the whole extension
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      -- mappings for incremental selection (visual mappings)
      init_selection = "gss", -- maps in normal mode to init the node/scope selection
      scope_incremental = "gsu", -- increment to the upper scope (as defined in locals.scm)
      node_incremental = "gsi", -- increment to the upper named parent
      node_decremental = "gsd" -- decrement to the previous node
    }
  },
  refactor = {
    highlight_defintions = {
      enable = true
    },
    highlight_current_scope = {
      enable = true -- Breaks virtual text
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr" -- mapping to rename reference under cursor
      }
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd", -- mapping to go to definition of symbol under cursor
        list_definitions = "gnD", -- mapping to list all definitions in current file
        goto_next_usage = "<c-n>",
        goto_previous_usage = "<c-p>"
      }
    }
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      }
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["}c"] = "@class.outer"
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["}C"] = "@class.outer"
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["{c"] = "@class.outer"
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["{C"] = "@class.outer"
      }
    }
  }
}
