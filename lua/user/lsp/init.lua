local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- ✋ Hi, this is config using navigator.lua X my cofiguration, as default
--    navigator.lua allow both, or single configuration running at same times
--    i'm set to both because i have specific config that i'm needed for doing something

-- 💾 Information
--    If someting not as expected and breaking this configuration, and showing
--    error with specific from navigator lua you can do with information bellow

-- 🌲 Activate comment below on require('user.lsp.lsp-installer')
--    this is will load automatically lsp server, using nvim-lsp-installer with builtin
--    function to overrides server loaded, remove navigator setup server inside handlers()

-- 🚑 Emergency Information
--    if you're using options config, dont forget to disable diagnostics, auto format from
--    default language server, let null_ls handle diagnostics, formatter for specified filetype
--    with eslint, prettier or whatever based on available server nvim-lsp-installer
--    and add your config inside user.lsp.handlers.setup()

--    let's cheers 🍺
--    Unicorns 🦄

-- require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require "user.lsp.null_ls"
