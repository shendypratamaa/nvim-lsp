local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting

local action = null_ls.builtins.code_actions

local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.eslint_d,
	diagnostics.eslint_d.with({
		extra_args = { "--config-path", vim.fn.expand("/usr/local/lib/node_modules/eslint_d/bin/") },
	}),
	formatting.stylua,
	formatting.prettier.with({
		filetype = {
			"vim",
			"lua",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"html",
			"json",
			"yaml",
			"markdown",
		},
		extra_args = { "--no-semi", "--single-quotes", "--jsx-single-quotes", "--tsx-single-quotes" },
	}),
	action.gitsigns,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
