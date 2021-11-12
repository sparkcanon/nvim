vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false

require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	context_commentstring = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	matchup = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})
