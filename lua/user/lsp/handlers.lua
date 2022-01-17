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
		transparency = 100,
		combined_attach = "both",
		lsp_signature_help = true,
		default_mapping = false,
		keymaps = {
			{ key = "<C-]>", func = "require('navigator.definition').definition()" },
			{ key = "RE", func = "require('navigator.reference').reference()" },
			{ key = "g0", func = "require('navigator.symbols').document_symbols()" },
			{ key = "gt", func = "require('navigator.treesitter').buf_ts()" },
			{ key = "gT", func = "require('navigator.treesitter').bufs_ts()" },
			{ key = "ga", mode = "n", func = "require('navigator.codeAction').code_action()" },
			{ key = "gA", mode = "v", func = "range_code_action()" },
			{ key = "RR", func = "require('navigator.rename').rename()" },
			{ mode = "i", key = "<M-u>", func = "signature_help()" },
			{ key = "<c-k>", func = "signature_help()" },
			{ key = "gD", func = "declaration({ border = 'rounded', max_width = 80 })" },
			{ key = "K", func = "hover({ popup_opts = { border = single, max_width = 80 }})" },
			-- { key = "<Space>D", func = "type_definition()" },
			-- { key = "gp", func = "require('navigator.definition').definition_preview()" },
			-- { key = "Gr", func = "require('navigator.reference').async_ref()" },
			{ key = "gi", func = "incoming_calls()" },
			{ key = "gO", func = "outgoing_calls()" },
			{ key = "gK", func = "require('navigator.diagnostics').show_buf_diagnostics()" },
			{ key = "]r", func = "require('navigator.treesitter').goto_next_usage()" },
			{ key = "[r", func = "require('navigator.treesitter').goto_previous_usage()" },
			{ key = "[g", func = "require('navigator.dochighlight').hi_symbol()" },
			{ key = "le", mode = "n", func = "require('navigator.codelens').run_action()" },
			{ key = "]d", func = "diagnostic.goto_next({ border = 'single', max_width = 80})" },
			{ key = "[d", func = "diagnostic.goto_prev({ border = 'single', max_width = 80})" },
			{ key = "gl", func = "require('navigator.diagnostics').show_diagnostics()" },
			-- { key = "<Space>wa", func = "require('navigator.workspace').add_workspace_folder()" },
			-- { key = "<Space>wr", func = "require('navigator.workspace').remove_workspace_folder()" },
			-- { key = "<Space>ff", func = "formatting()", mode = "n" },
			-- { key = "<Space>ff", func = "range_formatting()", mode = "v" },
			-- { key = "<Space>wl", func = "require('navigator.workspace').list_workspace_folders()" },
		},
		on_attach = function(client, bufnr)
			if client.resolved_capabilities.document_highlight then
				vim.api.nvim_exec(
					[[
            augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              hi default GHTextViewDark guifg=#DCD7BA guibg=#363646
              hi default GHListDark guifg=#C8C093 guibg=#1F1F28
              hi default GHListHl guifg=#D27E99 guibg=#404254
            augroup END
          ]],
					false
				)
			end

			local opts = { noremap = true, silent = true }
			local keymap = vim.api.nvim_buf_set_keymap

			-- lsp-native
			keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
			vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting_sync()]])

			if client.name == "tsserver" then
				client.resolved_capabilities.document_formatting = false
			end
			if client.name == "jsonls" then
				client.resolved_capabilities.document_formatting = false
			end
			if client.name == "stylelint_lsp" then
				client.resolved_capabilities.document_formatting = false
			end
			if client.name == "sumneko_lua" then
				client.resolved_capabilities.document_formatting = false
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
		end,
		lsp = {
			code_action = {
				enable = false,
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
			jsonls = {
				cmd = {
					install_root_dir
						.. "/jsonls/node_modules/vscode-langservers-extracted/bin/vscode-json-language-server",
					"--stdio",
				},
				settings = {
					json = {
						schemas = vim.list_extend(
							{
								{
									description = "TypeScript compiler configuration file",
									fileMatch = {
										"tsconfig.json",
										"tsconfig.*.json",
									},
									url = "https://json.schemastore.org/tsconfig.json",
								},
								{
									description = "Lerna config",
									fileMatch = { "lerna.json" },
									url = "https://json.schemastore.org/lerna.json",
								},
								{
									description = "Babel configuration",
									fileMatch = {
										".babelrc.json",
										".babelrc",
										"babel.config.json",
									},
									url = "https://json.schemastore.org/babelrc.json",
								},
								{
									description = "ESLint config",
									fileMatch = {
										".eslintrc.json",
										".eslintrc",
									},
									url = "https://json.schemastore.org/eslintrc.json",
								},
								{
									description = "Bucklescript config",
									fileMatch = { "bsconfig.json" },
									url = "https://raw.githubusercontent.com/rescript-lang/rescript-compiler/8.2.0/docs/docson/build-schema.json",
								},
								{
									description = "Prettier config",
									fileMatch = {
										".prettierrc",
										".prettierrc.json",
										"prettier.config.json",
									},
									url = "https://json.schemastore.org/prettierrc",
								},
								{
									description = "Vercel Now config",
									fileMatch = { "now.json" },
									url = "https://json.schemastore.org/now",
								},
								{
									description = "Stylelint config",
									fileMatch = {
										".stylelintrc",
										".stylelintrc.json",
										"stylelint.config.json",
									},
									url = "https://json.schemastore.org/stylelintrc",
								},
								{
									description = "Configuration file as an alternative for configuring your repository in the settings page.",
									fileMatch = {
										".codeclimate.json",
									},
									url = "https://json.schemastore.org/codeclimate.json",
								},
								{
									description = "Json schema for properties json file for a GitHub Workflow template",
									fileMatch = {
										".github/workflow-templates/**.properties.json",
									},
									url = "https://json.schemastore.org/github-workflow-template-properties.json",
								},
								{
									description = "golangci-lint configuration file",
									fileMatch = {
										".golangci.toml",
										".golangci.json",
									},
									url = "https://json.schemastore.org/golangci-lint.json",
								},
								{
									description = "JSON schema for the JSON Feed format",
									fileMatch = {
										"feed.json",
									},
									url = "https://json.schemastore.org/feed.json",
									versions = {
										["1"] = "https://json.schemastore.org/feed-1.json",
										["1.1"] = "https://json.schemastore.org/feed.json",
									},
								},
								{
									description = "Packer template JSON configuration",
									fileMatch = {
										"packer.json",
									},
									url = "https://json.schemastore.org/packer.json",
								},
								{
									description = "NPM configuration file",
									fileMatch = {
										"package.json",
									},
									url = "https://json.schemastore.org/package.json",
								},
								{
									description = "JSON schema for Visual Studio component configuration files",
									fileMatch = {
										"*.vsconfig",
									},
									url = "https://json.schemastore.org/vsconfig.json",
								},
								{
									description = "Resume json",
									fileMatch = { "resume.json" },
									url = "https://raw.githubusercontent.com/jsonresume/resume-schema/v1.0.0/schema.json",
								},
							},
							require("schemastore").json.schemas({
								select = {},
							})
						),
					},
				},
			},
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
				cmd = {
					install_root_dir .. "/sumneko_lua/extension/server/bin/lua-language-server",
					"--stdio",
				},
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			},
			stylelint_lsp = {
				cmd = {
					install_root_dir .. "/stylelint_lsp/node_modules/stylelint-lsp/dist/index.js",
					"--stdio",
				},
				filetypes = {
					"css",
					"scss",
					"sass",
					"less",
					"postcss",
				},
			},
			pyright = {
				cmd = {
					install_root_dir .. "/python/node_modules/pyright/langserver.index.js",
					"--stdio",
				},
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
							typeCheckingMode = "off",
						},
					},
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
				"pyright",
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

return M
