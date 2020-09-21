-- Color util
local cmd = vim.cmd
local C = {}

-- Modify buffer colors
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

  -- Hint: The below makes buffer transparent
  -- vim.cmd([[highlight! Normal guibg=NONE]])
end

-- Extract color values from highlight strings
-- TODO: check for nil values
local function getColorFromHighlights(string, t)
  local hi = vim.api.nvim_exec("hi " .. string, true)
  local colo = string.match(hi, "gui" .. t .. "=(%#[%a|%d]+)")
  return colo
end

-- Write colors to kitty colorscheme file
-- TODO: if statement looks horrible, find a better way
function C.ModifyKittyColors()
  local term_colors = {} -- Colors table

  local normalfg = getColorFromHighlights("Normal", "fg")
  local normalbg = getColorFromHighlights("Normal", "bg")
  local visualbg = getColorFromHighlights("Visual", "bg")
  local visualfg = getColorFromHighlights("Visual", "fg")
  local cursorbg = getColorFromHighlights("Cursor", "bg")
  local cursorfg = getColorFromHighlights("Cursor", "fg")

  table.insert(term_colors, "background " .. normalbg)
  table.insert(term_colors, "foreground " .. normalfg)

  -- if cursorbg is nil/NONE, use normalfg
  if (cursorbg == nil) then
    table.insert(term_colors, "cursor " .. normalfg)
  else
    table.insert(term_colors, "cursor " .. cursorbg)
  end

  -- if cursorfg is nil/NONE, use normalbg
  if (cursorfg == nil) then
    table.insert(term_colors, "cursor_text_color " .. normalfg)
  else
    table.insert(term_colors, "cursor_text_color " .. cursorfg)
  end

  -- if visualfg is nil/NONE, use normalfg
  if (visualbg == nil) then
    table.insert(term_colors, "selection_background " .. normalfg)
  else
    table.insert(term_colors, "selection_background " .. visualbg)
  end

  -- if visualfg is nil/NONE, use normalbg
  if (visualfg == nil) then
    table.insert(term_colors, "selection_foreground " .. normalbg)
  else
    table.insert(term_colors, "selection_foreground " .. visualfg)
  end

  for i = 0, 15 do
    table.insert(term_colors, "color" .. i .. " " .. vim.fn.eval("g:terminal_color_" .. i))
  end

  -- Write to file
  local home = vim.fn.expand("$HOME")
  local file = io.open(home .. [[/.config/kitty/colorscheme_nvim.conf]], "w+")
  for _, v in pairs(term_colors) do
    file:write(v)
    file:write("\n")
  end
  file:close()
end

return C
