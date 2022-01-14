local status_ok, lspsaga = pcall(require, "lspsaga")

if not status_ok then
	print("saga problem !")
	return
end

lspsaga.setup({
	debug = false,
	use_saga_diagnostic_sign = false,
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	diagnostic_header_icon = "🦕 ",
	code_action_icon = " ",
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	finder_definition_icon = "🌤   ",
	finder_reference_icon = "🌤   ",
	max_preview_lines = 40,
	finder_action_keys = {
		open = "o",
		vsplit = "v",
		split = "s",
		quit = {
			"<C-e>",
			"<C-h>",
			"<C-j>",
			"<C-k>",
			"<C-l>",
			"<C_N>",
		},
		scroll_down = "<C-n>",
		scroll_up = "<C-p>",
	},
	code_action_keys = {
		quit = {
			"<C-e>",
			"<C-h>",
			"<C-j>",
			"<C-k>",
			"<C-l>",
			"<C_N>",
		},
		exec = "<CR>",
	},
	rename_action_keys = {
		quit = "<C-e>",
		exec = "<CR>",
	},
	definition_preview_icon = "🧬 ",
	border_style = "single",
	rename_prompt_prefix = "🔮 ",
	server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
})
