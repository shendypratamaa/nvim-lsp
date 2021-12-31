" wrapper-vim-plug
source ~/.config/nvim/vimscript/vim-plug/plug.vim

luafile ~/.config/nvim/lua/user/settings.lua
luafile ~/.config/nvim/lua/user/keymaps-custom.lua
luafile ~/.config/nvim/lua/user/whichkey.lua

" nvim-lsp
luafile ~/.config/nvim/lua/user/lsp/init.lua
luafile ~/.config/nvim/lua/user/lsp/null_ls.lua
luafile ~/.config/nvim/lua/user/gitsigns.lua
luafile ~/.config/nvim/lua/user/lspsaga.lua
luafile ~/.config/nvim/lua/user/trouble.lua

" nvim-cmp
luafile ~/.config/nvim/lua/user/cmp.lua

" telescope file-exp
luafile ~/.config/nvim/lua/user/telescope.lua

luafile ~/.config/nvim/lua/user/treesitter.lua
luafile ~/.config/nvim/lua/user/autopairs.lua


" themes and utils
luafile ~/.config/nvim/lua/user/lualine.lua
luafile ~/.config/nvim/lua/user/indentblankline.lua
luafile ~/.config/nvim/lua/user/colorizer.lua
luafile ~/.config/nvim/lua/user/bufferline.lua
luafile ~/.config/nvim/lua/user/surround.lua
luafile ~/.config/nvim/lua/user/nvimtree.lua

" collaboration tools
source ~/.config/nvim/vimscript/dashboard.vim
source  ~/.config/nvim/vimscript/lazygit.vim
