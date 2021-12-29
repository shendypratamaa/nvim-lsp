" wrapper-vim-plug
source ~/.config/nvim/vimscript/vim-plug/plug.vim
source ~/.config/nvim/vimscript/settings.vim

" collaboration tools
source  ~/.config/nvim/vimscript/lazygit.vim

" keymap
source  ~/.config/nvim/vimscript/mapping.vim
source  ~/.config/nvim/vimscript/whichkey.vim

" configuration themes

let g:nvcode_termcolors=256

colorscheme gruvbox

if(has('termguicolors'))
  set termguicolors
  hi Normal guibg=NONE ctermbg=NONE
endif

" ============================================================ " 

" nvim-lsp-lua-snippets
luafile ~/.config/nvim/lua/user/lsp/init.lua
luafile ~/.config/nvim/lua/user/nvimtree.lua
luafile ~/.config/nvim/lua/user/trouble.lua

" nvim-cmp
luafile ~/.config/nvim/lua/user/cmp.lua

" telescope file-exp
luafile ~/.config/nvim/lua/user/telescope.lua
luafile ~/.config/nvim/lua/user/lsp/null_ls.lua
luafile ~/.config/nvim/lua/user/gitsign.lua

" themes and utils
source  ~/.config/nvim/lua/user/treesitter.lua
source  ~/.config/nvim/lua/user/lualine.lua
source  ~/.config/nvim/lua/user/indentblankline.lua
source  ~/.config/nvim/lua/user/colorizer.lua
source  ~/.config/nvim/lua/user/bufferline.lua
source  ~/.config/nvim/vimscript/dashboard.vim
