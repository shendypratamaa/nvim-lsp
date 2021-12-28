local status_ok, null_ls = pcall(require, 'null-ls')

if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting

local actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      filetype = {
        'vim',
        'lua',
        'javascript',
        'javascriptreact',
        'typescriptreact',
        'typescript',
        'html',
        'markdown',
        'css',
        'scss',
        'json',
        'yaml'
      },
      extra_args = {"--no-semi", "--jsx-single-quotes", "--tsx-single-quotes", "--single-quotes"}
    }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.ESLint,
    actions.gitsigns
  }
})
