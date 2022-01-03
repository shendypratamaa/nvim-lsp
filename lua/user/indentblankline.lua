vim.cmd([[highlight IndentBlanklineIndent1 guifg=#8be9fd gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#ff79c6 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#ffb86c gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#bd93f9 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#6272a4 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#f1fa8c gui=nocombine]])

vim.opt.list = true

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
})
