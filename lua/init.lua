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
    config = function()
      vim.defer_fn(function()
        require("copilot").setup(
          {
            suggestion = {
              enabled = true,
              auto_trigger = true,
              debounce = 75,
              keymap = {
                accept = "<M-l>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
              },
            },
          }
        )
      end, 100)
    end,
  }
  use {
    'lewis6991/gitsigns.nvim', -- Add git related info in the signs columns and popups
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'plugins/gitsigns'
    end
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
    config = function()
      require 'plugins/treesitter'
    end
  } -- Highlight, edit, and navigate code

  -- Debug
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'theHamsta/nvim-dap-virtual-text',
      'mxsdev/nvim-dap-vscode-js',
    },
    config = function()
      require 'plugins/dap'
    end
  }

  -- Testing
  use({
    'nvim-neotest/neotest',
    requires = {
      'haydenmeade/neotest-jest',
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        }
      })
    end
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
    config = function()
      require 'plugins/hydra'
    end
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
    config = function()
      require 'plugins/colorscheme'
    end
  }
  -- use {
  --   'feline-nvim/feline.nvim',
  --   requires = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     local ctp_feline = require('catppuccin.groups.integrations.feline')
  --
  --     ctp_feline.setup()
  --
  --     require("feline").setup({
  --       components = ctp_feline.get(),
  --     })
  --     -- require('feline').winbar.setup()
  --   end
  -- }
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
  use {
    'jose-elias-alvarez/null-ls.nvim', -- General purpose lsp
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require 'plugins/null'
    end
  }
  -- Complete lsp setup
  use({
    'ray-x/navigator.lua',
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
      { 'neovim/nvim-lspconfig' },
      {
        "ray-x/lsp_signature.nvim",
        config = function()
          require('lsp_signature').setup({
            floating_window = false,
          })
        end
      },
      {
        'SmiteshP/nvim-navic',
        config = function()
          vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
          local navic = require("nvim-navic")
          navic.setup {
            highlight = true
          }
        end
      }
    },
    config = function()
      local navic = require("nvim-navic")
      require 'navigator'.setup({
        mason = true,
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end
        end,
        lsp = {
          servers = { "tailwindcss" },
          disable_lsp = { 'denols', 'flow', 'eslint' }
        }
      })
    end
  })
  -- Manage external editor tooling i.e LSP servers
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  }
  -- Automatically install language servers to stdpath
  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "sumneko_lua",
          "cssls",
          "cssmodules_ls",
          "eslint",
          "html",
          "jsonls",
          "prismals",
          "svelte",
          "tailwindcss",
          "tsserver",
          "vimls",
          "denols"
        }
      })
    end
  }
  -- Autocompletion
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'rcarriga/cmp-dap',
      { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }, -- Snippet Engine and Snippet Expansion
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-path'
    },
    config = function()
      require 'plugins/cmp'
    end
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
    config = function()
      require 'plugins/telescope'
    end
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
