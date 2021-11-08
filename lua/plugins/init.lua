local fn = vim.fn

local install_path = fn.stdpath("config") .. "/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd("packadd packer.nvim")
local packer = require("packer")
packer.init({
	package_root = vim.fn.stdpath("config") .. "/pack",
})

packer.startup({
	function(use)
		use({
			"neovim/nvim-lspconfig",
			requires = {
				{
					"hrsh7th/nvim-cmp",
					config = function()
						require("plugins/cmp")
					end,
					requires = {
						{ "hrsh7th/cmp-nvim-lsp" },
						{ "hrsh7th/cmp-buffer" },
						{ "hrsh7th/cmp-path" },
						{ "hrsh7th/cmp-cmdline" },
						{ "hrsh7th/cmp-vsnip" },
						{ "hrsh7th/vim-vsnip" },
					},
				},
			},
		})
		use("christoomey/vim-tmux-navigator")
		use({
			"ThePrimeagen/harpoon",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("harpoon").setup({
					global_settings = {
						save_on_toggle = true,
						save_on_change = true,
						enter_on_sendcmd = false,
					},
				})
			end,
		})
		use({ "vim-test/vim-test" })
		use({
			"vuki656/package-info.nvim",
			requires = "MunifTanjim/nui.nvim",
			config = function()
				require("plugins/package-info")
			end,
		})
		use({
			"lewis6991/impatient.nvim",
			config = function()
				require("impatient").enable_profile()
			end,
		})
		use({ "mustache/vim-mustache-handlebars", ft = { "hbs", "handlebars" } })
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-telescope/telescope-node-modules.nvim",
				"elianiva/telescope-npm.nvim",
				"nvim-telescope/telescope-fzy-native.nvim",
				"nvim-lua/plenary.nvim",
			},
			config = function()
        require "plugins/telescope"
			end,
		})
		use({
			"lewis6991/gitsigns.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})
		use({ "sindrets/diffview.nvim", cmd = "DiffviewOpen" })
		use("rhysd/conflict-marker.vim")
		use("editorconfig/editorconfig-vim")
		use("kevinhwang91/nvim-bqf")
		use({
			"rose-pine/neovim",
			as = "rose-pine",
			config = function()
				-- Options (see available options below)
				vim.g.rose_pine_variant = "base"

				-- Load colorscheme after options
				vim.cmd("colorscheme rose-pine")
			end,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup({
					"*", -- Highlight all files, but customize some others.
					less = { rgb_fn = true }, -- Enable parsing rgb(...) functions in less.
					sass = { rgb_fn = true }, -- Enable parsing rgb(...) functions in sass.
					scss = { rgb_fn = true }, -- Enable parsing rgb(...) functions in scss.
					json = { rgb_fn = true }, -- Enable parsing rgb(...) functions in scss.
					js = { rgb_fn = true }, -- Enable parsing rgb(...) functions in scss.
					jsx = { rgb_fn = true }, -- Enable parsing rgb(...) functions in scss.
					tsx = { rgb_fn = true }, -- Enable parsing rgb(...) functions in scss.
					ts = { rgb_fn = true }, -- Enable parsing rgb(...) functions in scss.
				})
			end,
		})
		use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = { "jose-elias-alvarez/null-ls.nvim" } })
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			requires = {
				"windwp/nvim-ts-autotag",
				config = function()
					require("nvim-ts-autotag").setup()
				end,
			},
			config = function()
				require("plugins/treesitter")
			end,
		})
		use({
			"andymass/vim-matchup",
			config = function()
				vim.cmd([[let g:matchup_matchparen_offscreen = { 'method': 'popup' }]])
			end,
		})
		use({
			{ "tpope/vim-commentary", requires = "JoosepAlviste/nvim-ts-context-commentstring" },
			"tpope/vim-repeat",
			{ "tpope/vim-eunuch", cmd = { "Move", "Rename", "Delete", "Remove" } },
			{
				"tpope/vim-fugitive",
				config = function()
					vim.g.fugitive_pty = 0
				end,
			},
			"tpope/vim-surround",
		})
	end,
	config = {
		-- Move to lua dir so impatient.nvim can cache it
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})

require("packer_compiled")
vim.cmd("packadd! cfilter")
vim.cmd("packadd! matchit")
