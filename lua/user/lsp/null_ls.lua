local status_ok, null_ls = pcall(require, 'null-ls')

if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup {
  debug = true,
  sources = {
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quotes", "--jsx-single-quotes", "--tsx-single-quotes" } }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
  }
}
