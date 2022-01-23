local options = {
  syntax = "on",
  exrc = true,
  filetype = "plugin_indent_on",
  fileencoding = "utf8",
  hidden = true,
  number = true,
  virtualedit = "block",
  relativenumber = true,
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  hlsearch = true, -- highlight all matches on previous search pattern
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  splitbelow = true, -- force all horizontal splits to go below current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- written to file while editing with another program), it is not allowed
  cursorline = true, -- highlight the current line
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  numberwidth = 2,
  expandtab = true,
  smartindent = true,
  autoindent = true,
  smartcase = true,
  ignorecase = true,
  colorcolumn = "100",
  sidescrolloff = 8,
  guifont = "monospace:h17",
}

vim.opt.shortmess:append "c"
vim.g.cursorhold_updatetime = 100

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]]

vim.cmd [[
  fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  augroup neovim_rocks
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
  augroup END
]]

vim.cmd [[
    augroup Unicorns_Folding
      au BufReadPre * setlocal foldmethod=indent
      au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
    augroup END
]]

vim.cmd [[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]]

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
vim.cmd [[set nocompatible ]]
