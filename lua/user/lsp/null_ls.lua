local null_ls_status_ok, null_ls = pcall(require, "null-ls")

if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting

local actions = null_ls.builtins.code_actions

local sources = {
	formatting.eslint_d,
	formatting.stylua,
	formatting.stylelint,
	formatting.prettier.with({
		filetype = {
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
	formatting.black.with({ extra_args = { "--fast" } }),
	actions.gitsigns,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
