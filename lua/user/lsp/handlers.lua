local status_ok, navigator = pcall(require, "navigator")

if not status_ok then
	return
end

local M = {}

M.setup = function()
	navigator.setup({
		debug = false, -- log output
		width = 0.7, -- valeu of cols
		height = 0.38, -- listview height
		preview_height = 0.38,
		preview_lines = 40, -- total lines in preview screen
		preview_lines_before = 10, -- lines before the highlight line
		default_mapping = false,
		external = nil, -- true: enable for goneovim multigrid otherwise false
		border = "rounded", -- border style, can be one of 'none', 'single', 'double', "shadow"
		lines_show_prompt = 20, -- when the result list items number more than lines_show_prompt,
		treesitter_analysis = true, -- treesitter variable context
		transparency = 20, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil to disable it
		combined_attach = "both",
		lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
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
			disable_lsp = {},
			code_lens = false,
			disply_diagnostic_qf = true,
			diagnostic_load_files = false,
			diagnostic_virtual_text = true,
			diagnostic_update_in_insert = false,
			tsserver = {
				-- filetypes = {'typescript'} -- disable javascript etc,
				-- set to {} to disable the lspclient for all filetype
			},
			sumneko_lua = {
				-- sumneko_root_path = sumneko_root_path,
				-- sumneko_binary = sumneko_binary,
				-- cmd = {'lua-language-server'}
			},
			servers = {},
		},
		lsp_installer = false,
		icons = {
			icons = true,
			code_action_icon = "🦄",
			code_lens_action_icon = "👓",
			diagnostic_head = "💡",
			diagnostic_err = "🧨",
			diagnostic_warn = "🚧",
			diagnostic_info = [[👩]],
			diagnostic_hint = [[💁]],
			diagnostic_head_description = "👹 ",
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

local function lsp_highlight_document(client)
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap

	-- navigator
	keymap(bufnr, "n", "ga", "<cmd>lua require('navigator.codeAction').code_action()<CR>", opts)
	keymap(bufnr, "n", "gt", "<cmd>lua require('navigator.treesitter').buf_ts()<CR>", opts)
	keymap(bufnr, "n", "gT", "<cmd>lua require('navigator.treesitter').bufs_ts()<CR>", opts)
	keymap(bufnr, "n", "g0", "<cmd>lua require('navigator.symbols').document_symbols()<CR>", opts)
	keymap(bufnr, "n", "RR", "<cmd>lua require('navigator.reference').reference()<CR>", opts)
	-- keymap(bufnr, "n", "gW", "<cmd>lua require('navigator.workspace').workspace_symbol()<CR>", opts)
	-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration({border = 'rounded', max_width = 80})<CR>", opts)
	-- keymap(bufnr, "n", "gA", "<cmd>lua require('navigator.codelens').run_action()<CR>", opts)

	-- saga
	keymap(bufnr, "n", "gP", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap(bufnr, "n", "gR", "<cmd>Lspsaga rename<CR>", opts)
	keymap(bufnr, "n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap(bufnr, "n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

	-- lsp
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover({ popup_opts = { border = single, max_width = 80 }})<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	if client.name == "jsonls" then
		client.resolved_capabilities.document_formatting = false
	end
	if client.name == "stylelint_lsp" then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
