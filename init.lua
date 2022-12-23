-- Install plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

-- Vim options
require 'settings'
vim.cmd [[packadd Cfilter]]

require('lazy').setup({
  'kyazdani42/nvim-web-devicons',
  'mbbill/undotree',
  { 'zbirenbaum/copilot.lua', event = 'VimEnter' },
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'David-Kunz/markid',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-refactor',
    },
  },
  {
    'andrewferrier/debugprint.nvim',
    config = function()
      require('debugprint').setup()
    end,
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'theHamsta/nvim-dap-virtual-text',
      'mxsdev/nvim-dap-vscode-js',
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'haydenmeade/neotest-jest',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  'tpope/vim-fugitive',
  'tpope/vim-dispatch',
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-vinegar',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
    ft = { 'html', 'jsx', 'tsx', 'svelte' },
  },
  'christoomey/vim-tmux-navigator',
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  'anuvyklack/hydra.nvim',
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        -- for example, context is off by default, use this to turn it on
        -- show_current_context = true,
        -- show_current_context_start = true,
      }
    end,
  },
  { 'catppuccin/nvim', name = 'catppuccin' },
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup {
        window = {
          blend = 0,
        },
      }
    end,
  },
  { 'jose-elias-alvarez/null-ls.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
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
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'elianiva/telescope-npm.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        -- cond = vim.fn.executable 'make' == 1,
      },
    },
  },
}, {
  ui = {
    border = 'rounded',
  },
})

require 'mappings'
require 'autocmd'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
