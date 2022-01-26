-- NOTE: floating window from navigator highlighting weird, red color dominated functionName()
-- KANAGAWA
local kaganagawa_available, kanagawa = pcall(require, "kanagawa")
if not kaganagawa_available then
  return
end

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
