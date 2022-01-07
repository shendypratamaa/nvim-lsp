local status_ok, scroll = pcall(require, "neoscroll")

if not status_ok then
	return
end

scroll.setup({
	-- All these keys will be mapped to their corresponding default scrolling animation
	mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" },
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing_function = nil, -- Default easing function
	pre_hook = nil, -- Function to run before the scrolling animation starts
	post_hook = nil, -- Function to run after the scrolling animation ends
})

local t = {}
t["<C-u>"] = { "scroll", { "-0.20", "true", "100" } }
t["<C-d>"] = { "scroll", { "0.20", "true", "100" } }
t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }

require("neoscroll.config").set_mappings(t)