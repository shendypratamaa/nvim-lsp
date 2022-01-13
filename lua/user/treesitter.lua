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
	"markdown",
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
	ignore_install = {},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "gmm",
			scope_incremental = "gaa",
			node_decremental = "grr",
		},
	},
	refactor = {
		highlight_definitions = { enable = false },
		highlight_current_scope = { enable = false },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<s-T>",
				goto_previous_usage = "<s-G>",
			},
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		colors = {
			"#ff5874",
			"#ecc48d",
			"́#82aaff",
			"#ae81ff",
			"#7fdbca",
			"#a1cd5e",
			"#b2ceee",
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
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["tf"] = "@function.outer",
				["ti"] = "@function.inner",
				["tc"] = "@class.outer",
				["te"] = "@class.inner",

				-- Or you can define your own textobjects like this
				["iF"] = {
					python = "(function_definition) @function",
					cpp = "(function_definition) @function",
					c = "(function_definition) @function",
					java = "(method_declaration) @function",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<TAB>"] = "@parameter.inner",
				},
				swap_previous = {
					["<S-TAB>"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			lsp_interop = {
				enable = true,
				border = "rounded",
				peek_definition_code = {
					["<C-w>j"] = "@function.outer",
					["<C-w>k"] = "@class.outer",
				},
			},
		},
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		indent = { enable = true, disable = { "yaml" } },
	},
})
