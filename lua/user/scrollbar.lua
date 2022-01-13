local status_ok, scroll = pcall(require, "scrollbar")

local colors = require("tokyonight.colors").setup()

if not status_ok then
	print("scroll wrong!")
	return
end

scroll.setup({
	show = false,
	handle = {
		text = " ",
		color = colors.bg_highlight,
	},
	marks = {
		Search = { text = { "-", "=" }, priority = 0, color = colors.orange },
		Error = { text = { "-", "=" }, priority = 1, color = colors.error },
		Warn = { text = { "-", "=" }, priority = 2, color = colors.warning },
		Info = { text = { "-", "=" }, priority = 3, color = colors.info },
		Hint = { text = { "-", "=" }, priority = 4, color = colors.hint },
		Misc = { text = { "-", "=" }, priority = 5, color = colors.purple },
	},
	excluded_filetypes = {
		"",
		"prompt",
		"TelescopePrompt",
	},
	autocmd = {
		render = {
			"BufWinEnter",
			"TabEnter",
			"TermEnter",
			"WinEnter",
			"CmdwinLeave",
			"TextChanged",
			"VimResized",
			"WinScrolled",
		},
	},
	handlers = {
		diagnostic = true,
		search = false, -- Requires hlslens to be loaded
	},
})
