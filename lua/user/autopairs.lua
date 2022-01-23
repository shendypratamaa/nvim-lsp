local status_ok, npairs = pcall(require, "nvim-autopairs")

if not status_ok then
  return
end

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
  fast_wrap = {
    map = "<C-s>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"

local cmp_status_ok, cmp = pcall(require, "cmp")

if not cmp_status_ok then
  return
end

if vim.o.ft == "clap_input" and vim.o.ft == "guihua" and vim.o.ft == "guihua_rust" then
  cmp.setup.buffer { completion = { enable = false } }
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
