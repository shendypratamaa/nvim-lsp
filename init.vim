"wrapper-vim-plug
source ~/.config/nvim/plugins/plug.vim
source ~/.config/nvim/general/settings.vim

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
source  ~/.config/nvim/keys/mapping.vim
source  ~/.config/nvim/keys/whichkey.vim

" telescope file-exp
source  ~/.config/nvim/intellisense/telescope.lua

" collaboration tools
source  ~/.config/nvim/intellisense/lazygit.vim

" themes and utils 
source  ~/.config/nvim/intellisense/treesitter.lua
source  ~/.config/nvim/themes/dashboard.vim
source  ~/.config/nvim/themes/lualine.lua
source  ~/.config/nvim/themes/indentblankline.lua
source  ~/.config/nvim/themes/colorizer.lua
source  ~/.config/nvim/themes/bufferline.lua

" nvim-cmp
luafile ~/.config/nvim/lua/user/cmp.lua
