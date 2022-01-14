local status_ok, navigator = pcall(require, "navigator")

local status_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not status_ok and status_cmp then
	return
end

local M = {}

local path = require("nvim-lsp-installer.path")

local install_root_dir = path.concat({ vim.fn.stdpath("data"), "lsp_servers" })

M.setup = function()
	navigator.setup({
		debug = false,
		width = 0.7,
		height = 0.4,
		preview_height = 0.4,
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		preview_lines = 40,
		preview_lines_before = 15,
		external = nil,
		lines_show_prompt = 20,
		treesitter_analysis = true,
		transparency = 20,
		combined_attach = "both",
		lsp_signature_help = true,
		default_mapping = false,
		keymaps = {
			{ key = "gi", func = "incoming_calls()" },
			{ key = "gO", func = "outgoing_calls()" },
			{ key = "gG", func = "require('navigator.diagnostics').show_buf_diagnostics()" },
			{ key = "]r", func = "require('navigator.treesitter').goto_next_usage()" },
			{ key = "[r", func = "require('navigator.treesitter').goto_previous_usage()" },
			{ key = "[g", func = "require('navigator.dochighlight').hi_symbol()" },
			-- { key = "<Space>wa", func = "require('navigator.workspace').add_workspace_folder()" },
			-- { key = "<Space>wr", func = "require('navigator.workspace').remove_workspace_folder()" },
			-- { key = "<Space>ff", func = "formatting()", mode = "n" },
			-- { key = "<Space>ff", func = "range_formatting()", mode = "v" },
			-- { key = "<Space>wl", func = "require('navigator.workspace').list_workspace_folders()" },
			{ key = "le", mode = "n", func = "require('navigator.codelens').run_action()" },
		},
		on_attach = function(client, bufnr)
			if client.resolved_capabilities.document_highlight then
				vim.api.nvim_exec(
					[[
            augroup lsp_document_highlight
              autocmd! * <buffer>
      				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
          ]],
					false
				)
			end

			local opts = { noremap = true, silent = true }
			local keymap = vim.api.nvim_buf_set_keymap
			-- navigator
			keymap(bufnr, "n", "ga", "<cmd>lua require('navigator.codeAction').code_action()<CR>", opts)
			keymap(bufnr, "n", "gt", "<cmd>lua require('navigator.treesitter').buf_ts()<CR>", opts)
			keymap(bufnr, "n", "gT", "<cmd>lua require('navigator.treesitter').bufs_ts()<CR>", opts)
			keymap(bufnr, "n", "g0", "<cmd>lua require('navigator.symbols').document_symbols()<CR>", opts)
			keymap(bufnr, "n", "RE", "<cmd>lua require('navigator.reference').reference()<CR>", opts)
			-- keymap(bufnr, "n", "gW", "<cmd>lua require('navigator.workspace').workspace_symbol()<CR>", opts)
			-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration({border = 'rounded', max_width = 80})<CR>", opts)

			-- saga
			keymap(bufnr, "n", "gP", "<cmd>Lspsaga lsp_finder<CR>", opts)
			keymap(bufnr, "n", "gR", "<cmd>Lspsaga rename<CR>", opts)
			keymap(bufnr, "n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
			keymap(bufnr, "n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
			keymap(bufnr, "n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
			keymap(bufnr, "n", "gK", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)

			-- lsp
			keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
			keymap(bufnr, "n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
			vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
		end,
		lsp = {
			code_action = {
				enable = true,
				sign = true,
				sign_priority = 40,
				virtual_text = true,
				virtual_text_icon = true,
			},
			code_lens_action = {
				enable = true,
				sign = true,
				sign_priority = 40,
				virtual_text = true,
				virtual_text_icon = true,
			},
			format_on_save = false,
			disable_format_cap = {},
			disable_lsp = { "tailwindcss" },
			code_lens = true,
			disply_diagnostic_qf = false,
			diagnostic_load_files = false,
			diagnostic_virtual_text = true,
			diagnostic_update_in_insert = false,
			tsserver = {
				on_attach = function(client)
					client.resolved_capabilities.document_formatting = false
				end,
				cmd = {
					install_root_dir .. "/tsserver/node_modules/typescript-language-server/lib/cli.js",
					"--stdio",
				},
			},
			sumneko_lua = {
				on_attach = function(client)
					client.resolved_capabilities.document_formatting = false
				end,
				cmd = {
					install_root_dir .. "/sumneko_lua/extension/server/bin/lua-language-server",
					"--stdio",
				},
			},
			jsonls = {
				on_attach = function(client)
					client.resolved_capabilities.document_formatting = false
				end,
				cmd = {
					install_root_dir
						.. "/jsonls/node_modules/vscode-langservers-extracted/bin/vscode-json-language-server",
					"--stdio",
				},
			},
			stylelint_lsp = {
				on_attach = function(client)
					client.resolved_capabilities.document_formatting = false
				end,
				filetypes = {
					"css",
					"scss",
					"sass",
					"less",
					"postcss",
				},
				cmd = {
					install_root_dir .. "/stylelint_lsp/node_modules/stylelint-lsp/dist/index.js",
					"--stdio",
				},
			},
			tailwindcss = {
				cmd = {
					install_root_dir
						.. "/tailwindcss_npm/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server",
					"--stdio",
				},
			},
			html = {
				cmd = {
					install_root_dir
						.. "/html/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server",
					"--stdio",
				},
			},
			emmet_ls = {
				cmd = {
					install_root_dir .. "/emmet_ls/node_modules/emmet-ls/out/server.js",
					"--stdio",
				},
			},
			cssls = {
				cmd = {
					install_root_dir
						.. "/cssls/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server",
					"--stdio",
				},
			},
			vimls = {
				cmd = {
					install_root_dir .. "/vim/node_modules/vim-language-server/bin/index.js",
					"--stdio",
				},
			},
			servers = {
				"tsserver",
				"sumneko_lua",
				"vimls",
				"jsonls",
				"html",
				"stylelint_lsp",
				"emmet_ls",
				"tailwindcss",
				"cssls",
			},
		},
		lsp_installer = true,
		icons = {
			icons = true,
			code_action_icon = "🦄",
			code_lens_action_icon = "👓",
			diagnostic_head = "😷",
			diagnostic_err = "📛",
			diagnostic_warn = "🤒",
			diagnostic_info = [[👩]],
			diagnostic_hint = [[💁]],
			diagnostic_head_severity_1 = "👾 ",
			diagnostic_head_severity_2 = "👻 ",
			diagnostic_head_severity_3 = "🎃 ",
			diagnostic_head_description = "🧨 ",
			diagnostic_virtual_text = "🦊 ",
			diagnostic_file = "🚑 ",
			value_changed = "📝 ",
			value_definition = "🦕 ",
			match_kinds = {
				var = "🧛 ",
				method = "🍔 ",
				["function"] = "🗻 ",
				parameter = "🪂 ",
				associated = "🤝 ",
				namespace = "🚀 ",
				type = "🎹 ",
				field = "🏈 ",
			},
			treesitter_defult = "🌲",
		},
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
