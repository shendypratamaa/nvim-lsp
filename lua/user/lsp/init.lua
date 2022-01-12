local status_ok, nav = pcall(require, "navigator")

local status_installer, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok and status_installer then
	return
end

local path = require("nvim-lsp-installer.path")
local install_root_dir = path.concat({ vim.fn.stdpath("data"), "lsp_servers" })

nav.setup({
	debug = false, -- log output, set to true and log path: ~/.local/share/nvim/gh.log
	width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
	height = 0.3, -- max list window height, 0.3 by default
	preview_height = 0.35, -- max height of preview windows
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
	default_mapping = true, -- set to false if you will remap every key
	keymaps = {}, -- a list of key maps
	on_attach = function(client, bufnr)
		if server.name == "tsserver" then
			client.resolved_capabilities.document_formatting = false
		end
	end,
	lsp_installer.on_server_ready(function(server)
		local opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		if server.name == "jsonls" then
			local jsonls_opts = require("user.lsp.settings.jsonls")
			opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
		end
		if server.name == "sumneko_lua" then
			local sumneko_opts = require("user.lsp.settings.sumneko_lua")
			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		end
		if server.name == "stylelint_lsp" then
			local stylelint_opts = require("user.lsp.settings.stylelint")
			opts = vim.tbl_deep_extend("force", stylelint_opts, opts)
		end
		server:setup(opts)
	end),
	treesitter_analysis = true, -- treesitter variable context
	transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
	lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
	signature_help_cfg = nil, -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help
	icons = {
		code_action_icon = "🏏",
		diagnostic_head = "🐛",
		diagnostic_head_severity_1 = "🈲",
	},
	lsp_installer = true, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
	lsp = {
		code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
		code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
		format_on_save = false, -- set to false to disable lsp code format on save (if you are using prettier/efm/formater etc)
		disable_format_cap = {}, -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
		disable_lsp = {}, -- a list of lsp server disabled for your project, e.g. denols and tsserver you may
		diagnostic_virtual_text = false, -- show virtual for diagnostic message
		diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
		disply_diagnostic_qf = false, -- always show quickfix if there are diagnostic errors, set to false if you  want to
		tsserver = { cmd = { install_root_dir .. "~/.local/share/nvim/lsp_servers/tsserver" } },
		sumneko_lua = { cmd = { install_root_dir .. "~/.local/share/nvim/lsp_servers/sumneko_lua" } },
		jsonls = { cmd = { install_root_dir .. "~/.local/share/nvim/lsp_servers/jsonls" } },
		emmet_ls = { cmd = { install_root_dir .. "~/.local/share/nvim/lsp_servers/emmet_ls" } },
		stylelint_lsp = { cmd = { install_root_dir .. "~/.local/share/nvim/lsp_servers/stylelint_lsp" } },
		vimls = { cmd = { install_root_dir .. "~/.local/share/nvim/lsp_servers/vim" } },
	},
})

require("user.lsp.lsp-signature")
require("user.lsp.null_ls")
