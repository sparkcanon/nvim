-- Color util
local cmd = vim.cmd
local C = {}

function C.ModifyBufferColors()
  cmd([[highlight! EndOfBuffer ctermbg=NONE ctermfg=241 guibg=NONE]])
  cmd([[highlight! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE]])
  cmd([[highlight! link HighlightedyankRegion Visual]])
  cmd([[highlight! EndOfBuffer ctermbg=NONE ctermfg=241 guibg=NONE]])
  cmd([[highlight! LineNr ctermbg=NONE guibg=NONE]])

  cmd([[highlight! link LspDiagnosticsError ALEVirtualTextError]])
  cmd([[highlight! LspDiagnosticsHint guifg=#8389a3]])
  cmd([[highlight! LspDiagnosticsInformation guifg=#3f83a6]])
  cmd([[highlight! link LspDiagnosticsWarning ALEVirtualTextWarning]])

  -- vim.cmd([[highlight! Normal guibg=NONE]])
end

return C
