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

-- dashboard.section.header.val = {
-- 	[[                                                 ]],
-- 	[[                                                 ]],
-- 	[[                                                 ]],
-- 	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
-- 	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
-- 	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
-- 	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
-- 	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- 	[[                                                 ]],
-- 	[[                                                 ]],
-- }

-- dashboard.section.header.val = {
-- 	[[                                                        ]],
-- 	[[                                                        ]],
-- 	[[                                                        ]],
-- 	[[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
-- 	[[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
-- 	[[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
-- 	[[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
-- 	[[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
-- 	[[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
-- 	[[                                                        ]],
-- }

dashboard.section.header.val = {
	[[                                                    ]],
	[[                                                    ]],
	[[                                                    ]],
	[[██╗     ██╗████████╗███████╗██╗   ██╗██╗███╗   ███╗ ]],
	[[██║     ██║╚══██╔══╝██╔════╝██║   ██║██║████╗ ████║ ]],
	[[██║     ██║   ██║   █████╗  ██║   ██║██║██╔████╔██║ ]],
	[[██║     ██║   ██║   ██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	[[███████╗██║   ██║   ███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	[[╚══════╝╚═╝   ╚═╝   ╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	[[                                                    ]],
	[[====================================================]],
}

dashboard.section.buttons.val = {
	button("f", "📦 ➡️ Find Files", ":Telescope find_files <cr>"),
	button("e", "📖 ➡️ New Files", ":ene <BAR> startinsert <cr>"),
	button("r", "🔖 ➡️ Recently Files", ":Telescope oldfiles <cr>"),
	button("t", "🔭 ➡️ Find Text", ":Telescope live_grep <cr>"),
	button("w", "🧛 ➡️ Open Notes", ":e ~/.notes<cr>"),
	button("n", "🤖 ➡️ Configuration Neovim", ":e ~/.config/nvim/init.vim<cr>"),
	button("a", "🌈 ➡️ Configuration Alacritty", ":e ~/.config/alacritty/alacritty.yml<cr>"),
	button("z", "🪐 ➡️ Configuration Zshell", ":e ~/.zshrc<cr>"),
	button("d", "🦕 ➡️ Configuration Dashboard", ":e ~/.config/nvim/lua/user/dashboard.lua<cr>"),
	button("q", "👻 ➡️ Quit Neovim", ":qa<cr>"),
}

dashboard.section.footer.val = {
	"                          ",
	" w3.github/shendypratamaa ",
	"                          ",
	" 🚀 🤖 🎮  💾 🧟 🌓 🛸 🚀 ",
	"                          ",
}

alpha.setup(dashboard.opts)
