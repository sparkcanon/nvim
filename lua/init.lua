-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                                                    -- Package manager
  use 'lewis6991/impatient.nvim'
  use {                                                                           -- Tpope
    'tpope/vim-fugitive',                                                         -- Git stuff
    'tpope/vim-dispatch',                                                         -- Run in terminals
    'tpope/vim-sleuth',
    'tpope/vim-surround',                                                         -- Manipulate surroundings
    'tpope/vim-repeat'                                                            -- Repeat things
  }
  use {
    'lewis6991/gitsigns.nvim',                                                    -- Add git related info in the signs columns and popups
    requires = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
    end
  }
  use {                                                                           -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    config = function ()
      require('Comment').setup()
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',                                            -- Syntax Highlighting
    requires = {
      'David-Kunz/markid',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects'                               -- Additional textobjects for treesitter
    },
    config = function ()
      require 'plugins/treesitter'
    end
  }                                                                               -- Highlight, edit, and navigate code
  use 'neovim/nvim-lspconfig'                                                     -- Collection of configurations for built-in LSP client
  use {                                                                           -- Manage external editor tooling i.e LSP servers
    'williamboman/mason.nvim',
    config = function ()
      require('mason').setup()
    end
  }
  use 'williamboman/mason-lspconfig.nvim'                                         -- Automatically install language servers to stdpath
  use { 'hrsh7th/nvim-cmp',                                                       -- Autocompletion
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'rcarriga/cmp-dap',
      'hrsh7th/cmp-cmdline',
      { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }           -- Snippet Engine and Snippet Expansion
    },
    config = function ()
      require 'plugins/cmp'
    end
  }
  use {                                                                           -- Fancier statusline
    'nvim-lualine/lualine.nvim',
    config = function ()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'moonfly',
          component_separators = '│',
          section_separators = '',
        },
      }
    end
  }
  use {                                                                           -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require('indent_blankline').setup {
        char = '│',
        show_trailing_blankline_indent = false,
      }

    end
  }
  use {
    'bluz71/vim-moonfly-colors',
    config = function ()
      require 'plugins/moonfly'
      vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋' }
      vim.cmd [[colorscheme moonfly]]
    end
  }
  use {                                                                           -- Debugging
    'mfussenegger/nvim-dap', requires = {
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function ()
      require 'plugins/dap'
    end
  }
  use {                                                                           -- Jest (Needs Dap for debugging)
    'David-Kunz/jester',
    config = function ()
      require("jester").setup({
        path_to_jest_run = './node_modules/.bin/jest'
      })
    end
  }
  use {                                                                           -- Adds matching pair
    'windwp/nvim-autopairs',
    config = function ()
      require('nvim-autopairs').setup()
    end
  }
  use {                                                                           -- Adds closing tags
    'windwp/nvim-ts-autotag',
    config = function ()
      require('nvim-ts-autotag').setup()
    end,
    ft = {'html', 'jsx', 'tsx', 'svelte'}
  }
  use 'christoomey/vim-tmux-navigator'                                            -- Ability to navigate tmux panes
  use {                                                                           -- Display colours
    'NvChad/nvim-colorizer.lua',
    config = function ()
      require('colorizer').setup()
    end
  }
  use {
    'kevinhwang91/nvim-bqf',
    requires = {
      { 'junegunn/fzf', run = function()
        vim.fn['fzf#install']()
      end }
    },
    config = function ()
      require('bqf').setup {
        auto_resize_height = true,
      }
    end
  }                                                                               -- Enhanced quickfix window (Needs FZF for filtering)
  use {                                                                           -- Create floating terminals
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-t>]],
        shade_filetypes = { 'none' },
        direction = 'horizontal',
        insert_mappings = false,
        start_in_insert = false,
        float_opts = { border = 'rounded', winblend = 3 },
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return math.floor(vim.o.columns * 0.4)
          end
        end,
      })
    end
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require 'plugins/null'
    end
  }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'elianiva/telescope-npm.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }
    },
    config = function ()
      require 'plugins/telescope'
    end
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

require 'autocmd'
require 'settings'
require 'mappings'
require 'lsp'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
