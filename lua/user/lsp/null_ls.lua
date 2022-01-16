local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local actions = null_ls.builtins.code_actions

-- local diagnostics = null_ls.builtins.diagnostics || for now disable bcs showing twice with navigator

local sources = {
	formatting.stylua,
	formatting.prettier.with({
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"yaml",
			"markdown",
			"css",
		},
		extra_args = {
			"--no-semi",
			"--single-quote",
			"--jsx-single-quote",
			"--tsx-single-quote",
		},
	}),
	formatting.black.with({ extra_args = { "--fast" } }),
	actions.gitsigns,
	-- diagnostics.stylelint,
	-- diagnostics.flake8,
	-- diagnostics.eslint_d,
}

null_ls.setup({
	diagnostics_format = "(#{s}) #{m}",
	debug = false,
	sources = sources,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
          ]])
		end
	end,
})
