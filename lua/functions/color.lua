-- Color util
local cmd = vim.cmd
local term_colors = {}
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

local function getColorFromHighlights(string, bg)
  local hi = vim.api.nvim_exec("hi " .. string, true)
  local colo = string.match(hi, "gui" .. bg .. "=(%#[%a|%d]+)")
  return colo
end

function C.ModifyKittyColors()
  table.insert(term_colors, "background " .. getColorFromHighlights("Normal", "bg"))
  table.insert(term_colors, "foreground " .. getColorFromHighlights("Normal", "fg"))
  table.insert(term_colors, "cursor " .. getColorFromHighlights("Cursor", "bg"))
  table.insert(term_colors, "cursor_text_color " .. getColorFromHighlights("Cursor", "fg"))
  table.insert(term_colors, "selection_background " .. getColorFromHighlights("Visual", "bg"))
  table.insert(term_colors, "selection_foreground " .. getColorFromHighlights("Normal", "bg"))
  for i = 0, 15 do
    table.insert(term_colors, "color" .. i .. " " .. vim.fn.eval("g:terminal_color_" .. i))
  end
  local file = io.open("/Users/praborde/.config/kitty/colorscheme_nvim.conf", "w+")
  for _, v in pairs(term_colors) do
    file:write(v)
    file:write('\n')
  end
  file:close()
end

return C
