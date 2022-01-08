vim.cmd([[highlight IndentBlanklineIndent1 guifg=#8be9fd gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#ff79c6 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#ffb86c gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#bd93f9 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#6272a4 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#f1fa8c gui=nocombine]])

vim.opt.list = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_space_char_highlight_list = {
	"Error",
	"Function",
}
vim.g.indent_blankline_filetype = {
	"vim",
	"lua",
	"html",
	"markdown",
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"json",
}

vim.g.indent_blankline_buftype_exclude = {
	"NvimTree",
	"Dashboard",
}

require("indent_blankline").setup({
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
	show_trailing_blankline_indent = true,
})
