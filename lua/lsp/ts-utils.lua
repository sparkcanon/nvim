return function(client)
	local ts_utils = require("nvim-lsp-ts-utils")

	-- defaults
	ts_utils.setup({
		debug = false,
		disable_commands = false,
		enable_import_on_completion = false,

		-- import all
		import_all_timeout = 5000, -- ms
		-- lower numbers indicate higher priority
		import_all_priorities = {
			same_file = 1, -- add to existing import statement
			local_files = 2, -- git files or files with relative path markers
			buffer_content = 3, -- loaded buffer content
			buffers = 4, -- loaded buffer names
		},
		import_all_scan_buffers = 100,
		import_all_select_source = false,

		-- update imports on file move
		update_imports_on_move = true,
		require_confirmation_on_move = true,
		watch_dir = ".",

		-- filter diagnostics
		filter_out_diagnostics_by_severity = {},
		filter_out_diagnostics_by_code = {},

		-- inlay hints (requires typescript nightly)
		auto_inlay_hints = true,
		inlay_hints_highlight = "Comment",
	})

	-- required to enable ESLint code actions and formatting
	ts_utils.setup_client(client)
end
