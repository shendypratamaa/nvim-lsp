local status_ok, buff = pcall(require, "bufferline")

if not status_ok then
	return
end

buff.setup({
	options = {
		numbers = nil,
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator_icon = "🚀",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		name_formatter = function(buf)
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				text_align = "top",
				padding = 0,
			},
		},
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 18,
		diagnostics = "",
		diagnostics_update_in_insert = true,
		-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
		-- 	return "(" .. count .. ")"
		-- end,
		-- custom_filter = fonction(buf_number)
		-- 	if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
		-- 		return true
		-- 	end
		-- 	if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
		-- 		return true
		-- 	end
		-- 	if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
		-- 		return true
		-- 	end
		-- end,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = false,
		separator_style = { " ", " " },
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = "relative_directory",
	},
})
