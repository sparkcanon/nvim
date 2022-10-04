-- [[ Configure Telescope ]]
local actions = require 'telescope.actions'

-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  mappings = {
    i = {
      ['<C-u>'] = false,
      ['<C-d>'] = false,
      ['<C-o>'] = actions.select_all,
    },
  },
  prompt_prefix = '◍ ',
  selection_caret = '▶▶',
  extensions = {
    file_browser = {
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
      path = '%:p:h',
    },
  },
  pickers = {
    buffers = {
      initial_mode = 'normal',
      sort_mru = true,
      sort_lastused = true,
    },
    quickfix = {
      theme = 'dropdown',
      previewer = false,
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'dap')
pcall(require('telescope').load_extension, 'npm')
