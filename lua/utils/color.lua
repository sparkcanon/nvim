-- Color util
local cmd = vim.cmd
local C = {}

-- Modify buffer colors
function C.ModifyBufferColors()
  cmd [[highlight! EndOfBuffer ctermbg=NONE ctermfg=241 guibg=NONE]]
  cmd [[highlight! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE]]
  cmd [[highlight! link HighlightedyankRegion Visual]]
  cmd [[highlight! LineNr ctermbg=NONE guibg=NONE]]

  -- Hint: The below makes buffer transparent
  cmd [[highlight! Normal guibg=NONE]]
end

return C
