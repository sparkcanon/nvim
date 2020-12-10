-- Color util
local cmd = vim.cmd
local C = {}
local U = require "utils/general"

-- Modify buffer colors
function C.ModifyBufferColors()
  cmd([[highlight! EndOfBuffer ctermbg=NONE ctermfg=241 guibg=NONE]])
  cmd([[highlight! VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE]])
  cmd([[highlight! link HighlightedyankRegion Visual]])
  cmd([[highlight! LineNr ctermbg=NONE guibg=NONE]])

  -- Hint: The below makes buffer transparent
  vim.cmd([[highlight! Normal guibg=NONE]])
end

-- Write colors to kitty colorscheme file
-- TODO: if statement looks horrible, find a better way
function C.ModifyKittyColors()
  local term_colors = {} -- Colors table

  local normalfg = U.GetColorFromHighlights("Normal", "fg")
  local normalbg = U.GetColorFromHighlights("Normal", "bg")
  local visualbg = U.GetColorFromHighlights("Visual", "bg")
  local visualfg = U.GetColorFromHighlights("Visual", "fg")
  local cursorbg = U.GetColorFromHighlights("Cursor", "bg")
  local cursorfg = U.GetColorFromHighlights("Cursor", "fg")

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
