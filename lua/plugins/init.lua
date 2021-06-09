local fn = vim.fn

local install_path = fn.stdpath("config") .. "/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd "packadd packer.nvim"
end

vim.cmd "packadd packer.nvim"
local packer = require "packer"
packer.init {
  package_root = vim.fn.stdpath("config") .. "/pack"
}

packer.startup(
  function()
    use {
      "neovim/nvim-lspconfig",
      requires = {
        {
          "folke/lsp-trouble.nvim",
          requires = "kyazdani42/nvim-web-devicons"
        },
        {
          "ray-x/lsp_signature.nvim"
        },
        {
          "hrsh7th/nvim-compe",
          requires = {{"hrsh7th/vim-vsnip"}, {"rafamadriz/friendly-snippets"}},
          config = function()
            require "compe".setup {
              enabled = true,
              autocomplete = true,
              debug = false,
              min_length = 1,
              preselect = "enable",
              throttle_time = 80,
              source_timeout = 200,
              incomplete_delay = 400,
              max_abbr_width = 100,
              max_kind_width = 100,
              max_menu_width = 100,
              documentation = true,
              source = {
                path = true,
                buffer = true,
                calc = true,
                nvim_lsp = true,
                nvim_lua = true,
                vsnip = true
              }
            }
          end
        }
      }
    }
    use "j5shi/CommandlineComplete.vim"
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
        {
          "nvim-telescope/telescope-fzy-native.nvim"
        },
        {
          "folke/todo-comments.nvim",
          disable = true,
          config = function()
            require "todo-comments".setup()
          end
        }
      }
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      branch = "lua",
      config = function()
        vim.g.indent_blankline_char = "│"
        vim.cmd "let g:indent_blankline_filetype_exclude = ['TelescopePrompt', 'packer']" -- TODO: fix for telescope prompt
      end
    }
    use {
      "TimUntersberger/neogit",
      cmd = "Neogit",
      requires = {"sindrets/diffview.nvim", cmd = "DiffviewOpen"},
      config = function()
        require("neogit").setup(
          {
            integrations = {
              diffview = true
            }
          }
        )
      end
    }
    use "editorconfig/editorconfig-vim"
    use {"heavenshell/vim-jsdoc", cmd = "JsDoc", run = "make install"}
    use {
      "hoob3rt/lualine.nvim",
      config = function()
        require "lualine".setup {
          options = {
            section_separators = "",
            component_separators = "",
            theme = "iceberg_dark"
          },
          sections = {
            lualine_a = {"mode"},
            lualine_b = {"branch", "diff"},
            lualine_c = {"filename"},
            lualine_x = {
              {"diagnostics", sources = {"nvim_lsp"}},
              "filetype"
            },
            lualine_y = {"progress"},
            lualine_z = {"location"}
          }
        }
      end
    }
    use "kevinhwang91/nvim-bqf"
    use {"arzg/vim-substrata", opt = true}
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require "colorizer".setup {
          "*", -- Highlight all files, but customize some others.
          less = {rgb_fn = true}, -- Enable parsing rgb(...) functions in less.
          sass = {rgb_fn = true}, -- Enable parsing rgb(...) functions in sass.
          scss = {rgb_fn = true}, -- Enable parsing rgb(...) functions in scss.
          json = {rgb_fn = true}, -- Enable parsing rgb(...) functions in scss.
          js = {rgb_fn = true}, -- Enable parsing rgb(...) functions in scss.
          jsx = {rgb_fn = true}, -- Enable parsing rgb(...) functions in scss.
          tsx = {rgb_fn = true}, -- Enable parsing rgb(...) functions in scss.
          ts = {rgb_fn = true} -- Enable parsing rgb(...) functions in scss.
        }
      end
    }
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {
      "tpope/vim-commentary",
      "tpope/vim-repeat",
      {"tpope/vim-eunuch", cmd = {"Move", "Rename", "Delete", "Remove"}},
      {
        "tpope/vim-fugitive",
        config = function()
          vim.g.fugitive_pty = 0
        end
      },
      "tpope/vim-surround"
    }
    use {
      "justinmk/vim-dirvish",
      config = function()
        vim.g.loaded_netrwPlugin = 1
        vim.g.dirvish_mode = [[:sort ,^.*[/],]]
      end
    }
    use {
      "voldikss/vim-floaterm",
      config = function()
        vim.g.floaterm_position = "bottom"
        vim.g.floaterm_width = vim.fn.eval("&columns")
        vim.g.floaterm_height = 0.3
      end
    }
  end
)

vim.cmd "packadd! cfilter"
vim.cmd "packadd! matchit"
