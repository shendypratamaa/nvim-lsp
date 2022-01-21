local notify_ok, notify = pcall(require, "notify")
if not notify_ok then
	notify("notify not ok 🥶")
	return
end

notify.setup({
	-- Animation style (see below for details)
	stages = "slide",
	-- Function called when a new window is opened, use for changing win settings/config
	on_open = nil,
	-- Function called when a window is closed
	on_close = nil,
	-- Render function for notifications. See notify-render()
	render = "default",
	-- Default timeout for notifications
	timeout = 300,
	-- For stages that change opacity this is treated as the highlight behind the window
	-- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
	background_colour = "#2A2A37",
	-- Minimum width for notification windows
	minimum_width = 10,
	-- Icons for the different levels
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
})
