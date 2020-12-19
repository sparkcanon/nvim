local J = {}
local IAbbr = require 'utils.general'.IAbbr

function J.Javascript()
  vim.bo.suffixesadd = vim.bo.suffixesadd .. ".js,.jsx,.ts,.tsx,.vue"
  vim.cmd([[setlocal isfname+=@-@,#-#]])
  vim.bo.include = "from|require"
  vim.boincludeexpr = "substitute(v:fname, '#', 'web', '')"

  vim.bo.define = [[\v(export\s+(default\s+)?)?(var|let|const|(async\s+)?function|class)|export\s+]]

  vim.b.match_words =
    [[\<function\>:\<return\>,]] ..
    [[\<if\>:\<else\>,]] ..
      [[\<switch\>:\<case\>:\<default\>,]] .. [[\<do\>:\<while\>,]] .. [[\<try\>:\<catch\>:\<finally\>,]]

  IAbbr("(;", [[(<CR>);<C-c>0]])
  IAbbr("(,", [[(<CR>),<C-c>0]])
  IAbbr("{;", [[{<CR>};<C-c>0]])
  IAbbr("{,", [[{<CR>},<C-c>0]])
  IAbbr("[;", [[[<CR>];<C-c>0]])
  IAbbr("[,", [[[<CR>],<C-c>0]])

  IAbbr("scfu", [[const = () => {}<esc>2F=2h]])
  IAbbr("sif", [[if () {<CR><CR>}<Up>]])
  IAbbr("simp", [[import {} from '';<esc>2ha]])
end

return J
