vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}

local status_ok, nvimtree = pcall(require, "nvim-tree")

local config_ok, nvimtreeconfig = pcall(require, "nvim-tree.config")

if not status_ok and config_ok then
	return
end

local tree_cb = nvimtreeconfig.nvim_tree_callback

nvimtree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		side = "left",
		auto_resize = true,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "V", cb = tree_cb("vsplit") },
				{ key = "v", cb = tree_cb("split") },
			},
		},
	},
	filters = {
		dotfiles = true,
		custom = {},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	quit_on_open = 0,
	disable_window_picker = 0,
	root_folder_modifier = ":t",
	show_icons = {
		git = 1,
		folder = 1,
		files = 1,
		folder_arrows = 1,
	},
})
