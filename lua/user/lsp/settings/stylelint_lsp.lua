return {
	cmd = { "stylelint-lsp", "--stdio" },
	filetypes = { "css", "scss", "sass", "postcss", "less" },
	settings = {
		stylelintplus = {
			autoFixOnFormat = false,
			autoFixOnSave = false,
			configFile = {},
			configOverrider = {},
			cssInJs = true,
		},
	},
}
