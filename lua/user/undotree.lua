vim.g.undotree_RelativeTampstamp = 1
vim.g.undotree_ShortIndocators = 1
vim.g.undotree_HelpLine = 0
vim.g.undotree_WindowLayout = 3
vim.g.undotree_SplitWidth = 40
vim.g.undotree_DiffpanelHeight = 20
vim.g.undotree_SetFocusWhenToggle = 1

vim.cmd([[
 if has("persistant_undo")
   set undodir=$HOME/.vim/undodir
   set undofile
 endif
]])
