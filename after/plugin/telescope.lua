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
      mappings = {
        n = {
          ['<C-d>'] = actions.delete_buffer,
        },
      },
    },
    quickfix = {
      previewer = false,
    },
    find_files = {
      find_command = {
        'fd',
        '--type',
        'f',
        '--hidden',
        '--no-ignore',
        '--exclude',
        'node_modules',
        '--exclude',
        '.git',
        '--exclude',
        'coverage',
        '--exclude',
        '.log',
        '--exclude',
        '.next',
        '--glob',
        '',
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'dap')
pcall(require('telescope').load_extension, 'npm')
