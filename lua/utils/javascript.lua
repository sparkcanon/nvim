local J = {}

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
end

return J
