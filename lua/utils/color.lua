-- Color util
local cmd = vim.cmd
local C = {}

-- Modify buffer colors
function C.ModifyBufferColors()
	cmd([[highlight! EndOfBuffer ctermbg=NONE ctermfg=241 guibg=NONE]])
	cmd([[highlight! SignColumn ctermbg=NONE guibg=NONE]])

	-- Hint: The below makes buffer transparent
	cmd([[highlight! Normal guibg=NONE]])
end

return C
