"wrapper-vim-plug
source ~/.config/nvim/vimscript/vim-plug/plug.vim
source ~/.config/nvim/vimscript/settings.vim

" configuration themes

let g:nvcode_termcolors=256

colorscheme dracula

if (has("termguicolors"))
  set termguicolors
  hi Normal guibg=NONE ctermbg=NONE
  " hi clear cursorline
  hi Search guibg=#ff9df0 guifg=NONE
endif

" ============================================================ " 

" nvim-lsp-lua-snippets
luafile ~/.config/nvim/lua/user/lsp/init.lua
luafile ~/.config/nvim/lua/user/nvimtree.lua
luafile ~/.config/nvim/lua/user/trouble.lua

" keymap
source  ~/.config/nvim/vimscript/mapping.vim
source  ~/.config/nvim/vimscript/whichkey.vim

" telescope file-exp
source  ~/.config/nvim/lua/user/telescope.lua

" collaboration tools
source  ~/.config/nvim/vimscript/lazygit.vim

" themes and utils 
source  ~/.config/nvim/lua/user/treesitter.lua
source  ~/.config/nvim/vimscript/dashboard.vim
source  ~/.config/nvim/lua/user/lualine.lua
source  ~/.config/nvim/lua/user/indentblankline.lua
source  ~/.config/nvim/lua/user/colorizer.lua
source  ~/.config/nvim/lua/user/bufferline.lua

" nvim-cmp
luafile ~/.config/nvim/lua/user/cmp.lua
