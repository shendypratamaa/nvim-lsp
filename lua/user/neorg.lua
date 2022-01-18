local status_ok, neorg = pcall(require, "neorg")

if not status_ok then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.norg.concealer"] = {}, -- Allows for use of icons
		["core.norg.dirman"] = { -- Manage your directories with Neorg
			config = {
				workspaces = {
					my_workspace = "~/.notes",
				},
			},
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
			},
		},
	},
})

--- Loads the Neorg completion module
local function load_completion()
	neorg.modules.load_module("core.norg.completion", nil, {
		engine = "nvim-cmp", -- Choose your completion engine here
	})
end

-- If Neorg is loaded already then don't hesitate and load the completion
if neorg.is_loaded() then
	load_completion()
else -- Otherwise wait until Neorg gets started and load the completion module then
	neorg.callbacks.on_event("core.started", load_completion)
end
