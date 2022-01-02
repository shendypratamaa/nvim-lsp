local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

local parsers = require("nvim-treesitter.parsers")

local enabled_list = {
	"lua",
	"javascript",
	"tsx",
	"json",
	"typescript",
	"javascriptreact",
	"typescriptreact",
}

treesitter.setup({
	ensure_installed = {
		"html",
		"css",
		"javascript",
		"lua",
		"vim",
		"tsx",
		"typescript",
		"markdown",
		"json",
	},
	ignore_install = { "haskel" },
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		colors = {
			"#E06C75",
			"#E5C07B",
			"#98C379",
			"#56B6C2",
			"#61AFEF",
			"#C678DD",
			"#E06C75",
		},
		max_file_lines = nil,
		disable = vim.tbl_filter(function(p)
			local disable = true
			for _, lang in pairs(enabled_list) do
				if p == lang then
					disable = false
				end
			end
			return disable
		end, parsers.available_parsers()),
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	indent = { enable = true, disable = { "yaml", "yml" } },
})
