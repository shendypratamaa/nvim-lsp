local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

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

	-- nvim-lsp binding
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

	-- lspsaga binding
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua require'lspsaga.rename'.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "x", "gs", "<cmd>lua require'lspsaga.codeaction'.range_code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "g]", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "g[", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gk",
		"<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gl",
		"<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<C-f>",
		"<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<C-b>",
		"<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_ranger_formatting = false
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
