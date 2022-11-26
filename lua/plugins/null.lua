local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier.with({
      prefer_local = true
    }),
    null_ls.builtins.code_actions.gitsigns,
  },
}

