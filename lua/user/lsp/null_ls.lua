local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

-- PERFORMANCE: dont use eslint makin slowest editor ever !
local formatting = null_ls.builtins.formatting
local actions = null_ls.builtins.code_actions
-- local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.stylua.with {
    extra_args = {
      "--config-path",
      vim.fn.expand "~/.config/nvim/linter-config/.stylua.toml",
    },
  },
  formatting.prettierd.with {
    env = {
      PRETTIERD_DEFAULT_CONFIG = vim.fn.expand "~/.config/nvim/utils/linter-config/.prettierrc.json",
    },
    filetypes = {
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "css",
      "html",
    },
  },
  formatting.black.with { extra_args = { "--fast" } },
  formatting.eslint_d,
  actions.eslint_d,
  actions.gitsigns,
  -- diagnostics.stylelint,
  -- diagnostics.flake8,
  -- diagnostics.eslint_d,
}

null_ls.setup {
  diagnostics_format = "(#{s}) #{m}",
  debug = false,
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
          ]]
    end
  end,
}
