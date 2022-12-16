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
  use 'wbthomason/packer.nvim' -- Package manager
  use 'lewis6991/impatient.nvim' -- Cache config for faster startup
  use {
    "elihunter173/dirbuf.nvim",
    config = function()
      require("dirbuf").setup {
        show_hidden = true,
        sort_order = "directories_first",
      }
    end
  }
  use {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
  }
  use {
    'lewis6991/gitsigns.nvim', -- Add git related info in the signs columns and popups
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use { -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter', -- Syntax Highlighting
    requires = {
      'David-Kunz/markid',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects', -- Additional textobjects for treesitter
      'nvim-treesitter/nvim-treesitter-refactor'
    },
  } -- Highlight, edit, and navigate code

  -- Debug
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'theHamsta/nvim-dap-virtual-text',
      'mxsdev/nvim-dap-vscode-js',
    },
  }

  -- Testing
  use({
    'nvim-neotest/neotest',
    requires = {
      'haydenmeade/neotest-jest',
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  })

  -- Utils
  -- Tpope
  use {
    'tpope/vim-fugitive', -- Git stuff
    'tpope/vim-dispatch', -- Run stuff in terminals
    'tpope/vim-sleuth',
    'tpope/vim-surround', -- Manipulate surroundings
    'tpope/vim-repeat', -- Repeat things
  }
  -- Adds matching pair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
  -- Auto closing tags
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
    ft = { 'html', 'jsx', 'tsx', 'svelte' }
  }
  use 'christoomey/vim-tmux-navigator' -- Ability to navigate tmux panes

  -- Display colours
  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }
  use {
    'anuvyklack/hydra.nvim',
  }

  -- UI
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        -- for example, context is off by default, use this to turn it on
        -- show_current_context = true,
        -- show_current_context_start = true,
      }
    end
  }
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }
  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup({
        window = {
          blend = 0,
        },
      })
    end
  }

  -- lsp
  -- General purpose lsp
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  -- Complete lsp setup
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      -- winbar
      { 'SmiteshP/nvim-navic' },

      -- signature
      { 'ray-x/lsp_signature.nvim' },

      {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("trouble").setup {}
        end
      }
    },
  }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'elianiva/telescope-npm.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable "make" == 1
      },
    },
  }


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

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
