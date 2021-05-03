local fn = vim.fn
local packer = require "packer"

local install_path = fn.stdpath("config") .. "/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd "packadd packer.nvim"
end

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
        {"nvim-telescope/telescope-fzy-native.nvim"}
      }
    }
    use "hoob3rt/lualine.nvim"
    use "kevinhwang91/nvim-bqf"
    use {"folke/tokyonight.nvim", opt = true}
    use "norcalli/nvim-colorizer.lua"
    use {"gennaro-tedesco/nvim-jqx", cmd = "JqxList"}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"tpope/vim-commentary", "tpope/vim-repeat", "tpope/vim-eunuch", "tpope/vim-fugitive", "tpope/vim-surround"}
    use "justinmk/vim-dirvish"
    use "voldikss/vim-floaterm"
  end
)

require "plugins/general"
