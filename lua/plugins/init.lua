local fn = vim.fn

local install_path = fn.stdpath("config") .. "/pack/packer/opt/packer.nvim"
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

vim.cmd "packadd packer.nvim"
local packer = require "packer"
packer.init {
  package_root = vim.fn.stdpath("config") .. "/pack"
}

packer.startup {
  function(use)
    use {
      "neovim/nvim-lspconfig",
      requires = {
        {"folke/lsp-trouble.nvim", requires = "kyazdani42/nvim-web-devicons"},
        {"ray-x/lsp_signature.nvim"},
        {
          "hrsh7th/nvim-cmp",
          config = function()
            require "plugins/cmp"
          end,
          requires = {
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-cmdline"},
            {"hrsh7th/cmp-vsnip"},
            {"hrsh7th/vim-vsnip"}
          }
        }
      }
    }
    use "christoomey/vim-tmux-navigator"
    use {
      "vuki656/package-info.nvim",
      requires = "MunifTanjim/nui.nvim",
      config = function()
        require "plugins/package-info"
      end
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "indent_blankline".setup {
          char = "│",
          buftype_exclude = {"terminal"},
          filetype_exclude = {"packer", "Trouble"}
        }
      end
    }
    use {
      "lewis6991/impatient.nvim",
      config = function()
        require "impatient"
      end
    }
    use {"mustache/vim-mustache-handlebars", ft = {"hbs", "handlebars"}}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-telescope/telescope-node-modules.nvim",
        "elianiva/telescope-npm.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        "xiyaowong/telescope-emoji.nvim",
        "nvim-lua/plenary.nvim",
        {
          "rmagatti/session-lens",
          requires = {
            "rmagatti/auto-session",
            config = function()
              require "auto-session".setup {
                log_level = "info",
                auto_session_suppress_dirs = {"~/.config/nvim/tmp/dir_session"}
              }
            end
          },
          config = function()
            require "session-lens".setup({})
          end
        }
      },
      config = function()
        require "telescope".load_extension "node_modules"
        require "telescope".load_extension "npm"
        require "telescope".load_extension "fzy_native"
        require "telescope".load_extension "emoji"
        require "telescope".setup {
          extensions = {
            fzy_native = {
              override_generic_sorter = false,
              override_file_sorter = true
            }
          }
        }
      end
    }
    use {
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require "gitsigns".setup()
      end
    }
    use {"sindrets/diffview.nvim", cmd = "DiffviewOpen"}
    use "rhysd/conflict-marker.vim"
    use "editorconfig/editorconfig-vim"
    use {"heavenshell/vim-jsdoc", cmd = "JsDoc", run = "make install"}
    use "kevinhwang91/nvim-bqf"
    use(
      {
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
          -- Options (see available options below)
          vim.g.rose_pine_variant = "base"

          -- Load colorscheme after options
          vim.cmd("colorscheme rose-pine")
        end
      }
    )
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
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "plugins/treesitter"
      end,
      requires = {
        {
          "code-biscuits/nvim-biscuits",
          config = function()
            require "nvim-biscuits".setup {
              default_config = {
                max_length = 30,
                min_distance = 5,
                prefix_string = " 📎 "
              },
              language_config = {
                html = {
                  prefix_string = " 🌐 "
                },
                js = {
                  prefix_string = " ✨ ",
                  max_length = 80
                },
                jsx = {
                  prefix_string = " ✨ ",
                  max_length = 80
                },
                tsx = {
                  prefix_string = " ✨ ",
                  max_length = 80
                },
                ts = {
                  prefix_string = " ✨ ",
                  max_length = 80
                }
              }
            }
          end
        }
      }
    }
    use {
      {"tpope/vim-commentary", requires = "JoosepAlviste/nvim-ts-context-commentstring"},
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
      "voldikss/vim-floaterm",
      config = function()
        vim.g.floaterm_position = "bottom"
        vim.g.floaterm_width = vim.fn.eval("&columns")
        vim.g.floaterm_height = 0.3
      end
    }
    if packer_bootstrap then
      require "packer".sync()
    end
  end,
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
  }
}

vim.o.termguicolors = true -- True colors
require("packer_compiled")
vim.cmd "packadd! cfilter"
vim.cmd "packadd! matchit"
