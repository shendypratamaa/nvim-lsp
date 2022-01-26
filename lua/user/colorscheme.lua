vim.cmd [[
    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
   endif
]]

require "user.colorshemelist.gruvbox"
require "user.colorshemelist.tokyonight"
require "user.colorshemelist.nightfly"
require "user.colorshemelist.kanagawa"
require "user.colorshemelist.dracula"
require "user.colorshemelist.catppuccin"

local notif = require "notify"

-- opts | tokyonight -- kanagawa -- dracula -- nightfly -- gruvbox-material -- catppuccin
local colorscheme = "gruvbox-material"

local colorscheme_available, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not colorscheme_available then
  local info = "\nReturn back to gruvbox colorscheme"
  notif("Colorscheme " .. colorscheme .. " Not found!" .. info, "warn")

  return vim.cmd("colorscheme " .. "gruvbox-material")
end
