require("telescope").load_extension("node_modules")
require("telescope").load_extension("npm")
require("telescope").load_extension("fzy_native")

local ivy_theme = { theme = "ivy" }
local cursor_theme = { theme = "cursor" }

require("telescope").setup({
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
	pickers = {
		find_files = ivy_theme,
		file_browser = ivy_theme,
		live_grep = ivy_theme,
		keymaps = ivy_theme,
		buffers = ivy_theme,
		loclist = ivy_theme,
		commands = ivy_theme,
		jumplist = ivy_theme,
		registers = ivy_theme,
		reloader = ivy_theme,
		colorscheme = ivy_theme,
		help_tags = ivy_theme,
		vim_options = ivy_theme,
		search_history = ivy_theme,
		command_history = ivy_theme,
		git_stash = ivy_theme,
		git_status = ivy_theme,
		git_branches = ivy_theme,
		git_commits = ivy_theme,
		current_buffer_fuzzy_find = ivy_theme,
		grep_string = ivy_theme,
		lsp_workspace_diagnostics = ivy_theme,
		lsp_document_diagnostics = ivy_theme,
		lsp_dynamic_workspace_symbols = ivy_theme,
		lsp_workspace_symbols = ivy_theme,
		lsp_document_symbols = ivy_theme,
		lsp_code_actions = cursor_theme,
		lsp_references = ivy_theme,
		lsp_implementations = ivy_theme,
		lsp_type_definitions = ivy_theme,
		lsp_definitions = ivy_theme,
	},
})
