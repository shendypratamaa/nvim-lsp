-- TOKYONIGHT
-- vim.g.tokyonight_terminal_colors = "xterm-256color"
-- vim.g.tokyonight_italic_comments = true -- default
-- vim.g.tokyonight_italic_keywords = true -- default
-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_terminal_colors = true
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_hide_inactive_statusline = true vim.g.tokyonight_sidebar = {}
-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_dark_sidebar = true
-- vim.g.tokyonight_dark_float = true
-- vim.g.tokyonight_colors = {}
-- vim.g.tokyonight_lualine_bold = true

-- DRACULA
-- vim.g.dracula_show_end_of_buffer = false
-- vim.g.dracula_transparent_bg = false
-- vim.g.dracula_lualine_bg_color = "#44475a"

-- NIGHTFLY
-- vim.g.moonflyIgnoreDefaultColors = 1
-- vim.g.nightflyCursorColor = 1
-- vim.g.nightflyItalics = 1
-- vim.g.nightflyNormalFloat = 1
-- vim.g.nightflyTerminalColors = 1
-- vim.g.nightflyTransparent = 1
-- vim.g.nightflyUndercurls = 1
-- vim.g.nightflyUnderlineMatchParen = 1
-- vim.g.nightflyVertSplits = 1

-- Kanagawa X Gruvbox
local status_ok, kanagawa = pcall(require, "kanagawa")

if not status_ok then
	return
end

kanagawa.setup({
	undercurl = true, -- enable undercurls
	commentStyle = "italic",
	functionStyle = "NONE",
	keywordStyle = "italic",
	statementStyle = "NONE",
	typeStyle = "NONE",
	variablebuiltinStyle = "italic",
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = true, -- do not set background color
	dimInactive = false,
	colors = {},
	overrider = {},
})

vim.cmd([[colorscheme kanagawa]])
