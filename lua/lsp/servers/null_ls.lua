local null_ls = require("null-ls")

null_ls.config({
	sources = {
		null_ls.builtins.formatting.prettierd.with({
			prefer_local = true,
		}),
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.trim_whitespace,

		null_ls.builtins.code_actions.eslint_d.with({
			prefer_local = true,
		}),
		null_ls.builtins.code_actions.gitsigns,

		null_ls.builtins.diagnostics.eslint_d.with({
			prefer_local = true,
		}),
		null_ls.builtins.diagnostics.vint,

		-- null_ls.builtins.formatting.stylelint
		-- null_ls.builtins.diagnostics.hadolint
		-- null_ls.builtins.diagnostics.vint
		-- null_ls.builtins.diagnostics.yamllint
	},
})
