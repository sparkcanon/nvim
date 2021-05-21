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
          requires = {{"hrsh7th/vim-vsnip"}, {"rafamadriz/friendly-snippets"}}
        }
      }
    }
    use "j5shi/CommandlineComplete.vim"
    use {"sindrets/diffview.nvim", cmd = {"DiffviewOpen"}}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
        {
          "nvim-telescope/telescope-fzy-native.nvim"
        },
        {
          "folke/todo-comments.nvim"
        }
      }
    }
    use {"heavenshell/vim-jsdoc", cmd = "JsDoc", run = "make install"}
    use "hoob3rt/lualine.nvim"
    use "kevinhwang91/nvim-bqf"
    use {"folke/tokyonight.nvim", opt = true}
    use "norcalli/nvim-colorizer.lua"
    use {"gennaro-tedesco/nvim-jqx", cmd = "JqxList"}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {
      "tpope/vim-commentary",
      "tpope/vim-repeat",
      {"tpope/vim-eunuch", cmd = {"Move", "Rename", "Delete", "Remove"}},
      "tpope/vim-fugitive",
      "tpope/vim-surround"
    }
    use "justinmk/vim-dirvish"
    use "voldikss/vim-floaterm"
  end
)

require "plugins/general"
