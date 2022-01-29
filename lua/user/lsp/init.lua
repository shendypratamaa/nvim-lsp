local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- ✋ Hi, this is config using navigator.lua X my cofiguration, as default
--    navigator.lua allow both, or single configuration running at same times
--    i'm set to both because i have specific config that i'm needed for doing something

--    let's cheers 🍺
--    Unicorns 🦄

require("user.lsp.handlers").setup()
require "user.lsp.null_ls"
