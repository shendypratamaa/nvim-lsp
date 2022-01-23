vim.cmd [[
    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif
]]

-- TOKYONIGHT
vim.g.tokyonight_terminal_colors = "xterm-256color"
vim.g.tokyonight_italic_comments = true -- default
vim.g.tokyonight_italic_keywords = true -- default
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_sidebar = {}
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = {}
vim.g.tokyonight_lualine_bold = true

-- DRACULA
vim.g.dracula_show_end_of_buffer = true
vim.g.dracula_transparent_bg = true
vim.g.dracula_lualine_bg_color = "#44475a"

-- NIGHTFLY
vim.g.moonflyIgnoreDefaultColors = 1
vim.g.nightflyCursorColor = 1
vim.g.nightflyItalics = 1
vim.g.nightflyNormalFloat = 1
vim.g.nightflyTerminalColors = 1
vim.g.nightflyTransparent = 1
vim.g.nightflyUndercurls = 1
vim.g.nightflyUnderlineMatchParen = 1
vim.g.nightflyVertSplits = 1

-- KANAGAWA
local kaganagawa_available, kanagawa = pcall(require, "kanagawa")
if not kaganagawa_available then
  return
end

local notif = require "notify"

kanagawa.setup {
  undercurl = true, -- enable undercurls
  commentStyle = "italic",
  functionstyle = "none",
  keywordStyle = "italic",
  statementstyle = "none",
  typestyle = "none",
  variablebuiltinstyle = "italic",
  specialreturn = true, -- special highlight for the return keyword
  specialexception = true, -- special highlight for exception handling keywords
  transparent = true, -- do not set background color
  diminactive = false,
  colors = {},
  overrider = {},
}

-- GRUVBOX_MATERIAL
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_materual_enable_italic = 1
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_enable_bold = 0
vim.g.gruvbox_material_cursor = "auto"
vim.g.gruvbox_material_current_word = "grey background"
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_visual = "grey background"
vim.g.gruvbox_materual_menu_selection_background = "grey"
vim.g.gruvbox_material_sign_column_background = "default"
vim.g.gruvbox_material_spell_foreground = "colored"
vim.g.gruvbox_material_ui_contrast = "low"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_statusline_style = "original"
vim.g.gruvbox_material_palette = "original"
vim.g.gruvbox_material_better_performance = 1

-- opts | tokyonight -- kanagawa -- dracula -- nightfly -- gruvbox-material -- catppuccin
local colorscheme = "gruvbox-material"

local colorscheme_available, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not colorscheme_available then
  local info = "\nReturn back to kanagawa colorscheme"
  notif("Colorscheme " .. colorscheme .. " Not found!" .. info, "error")

  return vim.cmd("colorscheme " .. "gruvbox-material")
end
