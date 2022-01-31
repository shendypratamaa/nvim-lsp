local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

-- PERFORMANCE: dont use eslint CPU LOAD ISSUE!
local formatting = null_ls.builtins.formatting
local actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.stylua.with {
    extra_args = {
      "--config-path",
      vim.fn.expand "~/.config/nvim/linter-config/.stylua.toml",
    },
  },
  formatting.prettierd.with {
    env = {
      PRETTIERD_DEFAULT_CONFIG = vim.fn.expand "~/.config/nvim/linter-config/.prettierrc.json",
    },
    filetypes = {
      "json",
      "jsonc",
      "yaml",
      "toml",
      "markdown",
      "html",
    },
  },
  formatting.stylelint.with {
    env = {
      STYLELINT_DEFAULT_CONFIG = vim.fn.expand "~/.config/nvim/linter-config/.stylelint.json",
    },
    filetypes = {
      "scss",
      "less",
      "css",
      "sass",
    },
  },
  formatting.eslint_d.with {
    env = {
      ESLINT_D_DEFAULT_CONFIG = vim.fn.expand "~/.config/nvim/linter-config/.eslintrc.json",
    },
  },
  formatting.black.with {
    extra_args = { "--fast" },
  },
  actions.eslint_d,
  diagnostics.eslint_d,
  diagnostics.stylelint,
  diagnostics.flake8,
  actions.gitsigns,
}

null_ls.setup {
  diagnostics_format = "[#{c}] #{m} (#{s})",
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
