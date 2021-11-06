local U = {}

-- Create augroups
function U.Create_augroup(definitions)
	for group_name, definition in pairs(definitions) do
		vim.cmd("augroup " .. group_name)
		vim.cmd("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.cmd(command)
		end
		vim.cmd("augroup END")
	end
end

-- Key mapping
function U.map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Abbr
function U.SetupCommandAbbr(from, to)
	vim.fn.execute(
		"cnoreabbrev <expr> "
			.. from
			.. " ((getcmdtype() ==# ':' && getcmdline() ==# '"
			.. from
			.. "') ? ('"
			.. to
			.. "') : ('"
			.. from
			.. "'))"
	)
end

function U.merge_table(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v
	end
	return t1
end

return U
