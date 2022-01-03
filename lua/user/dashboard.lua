local status_ok, alpha = pcall(require, "alpha")

if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
	local b = dashboard.button(sc, txt, keybind, keybind_opts)
	b.opts.hl = "Function"
	b.opts.hl_shortcut = "Type"
	return b
end

dashboard.section.header.val = {
	[[                                                 ]],
	[[                                                 ]],
	[[                                                 ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	[[                                                 ]],
	[[                                                 ]],
}

dashboard.section.buttons.val = {
	button("f", "  Find file", ":Telescope find_files <CR>"),
	button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	button("t", "  Find text", ":Telescope live_grep <CR>"),
	button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
	button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.val = {
	"                          ",
	" w3.github/shendypratamaa ",
	"                          ",
	"🚀 🤖 👽 🎮 💾 🧟 🌓 🛸 🚀",
	"                          ",
}

alpha.setup(dashboard.opts)
