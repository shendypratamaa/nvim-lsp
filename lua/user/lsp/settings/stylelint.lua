return {
	cmd = { "stylelint-lsp", "--stdio" },
	filetypes = { "css", "scss", "sass", "postcss", "less" },
	settings = {
		stylelintplus = {
			autoFixOnFormat = true,
			autoFixOnSave = true,
			configFile = { "vim.NIL" },
			configOverrider = { "vim.NIL" },
			cssInJs = false,
		},
	},
}
