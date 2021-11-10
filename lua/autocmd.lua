local autocmd = {
	ColorsCmd = {
		{
			"ColorScheme",
			"*",
			[[lua require 'utils/color'.ModifyBufferColors()]],
		},
	},
	GeneralAutocmds = {
		{
			"VimResized",
			"*",
			"wincmd =",
		},
		{
			"QuickFixCmdPost",
			"[^l]*",
			"botright cwindow",
		},
		{
			"QuickFixCmdPost",
			"l*",
			"lwindow",
		},
		{
			"BufWritePost",
			"init.lua",
			"source <afile> | PackerCompile",
		},
	},
	FileTypeAutocmd = {
		{
			"FileType",
			"javascript,javascriptreact,typescript,typescriptreact",
			[[lua require 'utils/javascript'.Javascript()]],
		},
	},
	MkdirAutocmd = {
		{
			"BufNewFile",
			"*",
			[[call utils#mkdir(expand('<afile>:p:h'))]],
		},
	},
}

vim.cmd([[
autocmd WinNew * au BufEnter * ++once
			\ if (&bt ==? 'help' || &ft ==? 'man' || &ft ==? 'fugitive')
			\     && winwidth(winnr('#')) >= 176 |
			\ exe 'wincmd ' . (&splitright ? 'L' : 'H') |
			\ endif
]])

require("utils/general").Create_augroup(autocmd)
