" vim-plug
source ~/.config/nvim/vimscript/vim-plug/plug.vim

" themes and utils
luafile ~/.config/nvim/lua/user/settings.lua
luafile ~/.config/nvim/lua/user/color-scheme.lua
luafile ~/.config/nvim/lua/user/dashboard.lua
luafile ~/.config/nvim/lua/user/lualine.lua
luafile ~/.config/nvim/lua/user/indentblankline.lua
luafile ~/.config/nvim/lua/user/colorizer.lua
luafile ~/.config/nvim/lua/user/bufferline.lua
luafile ~/.config/nvim/lua/user/nvimtree.lua
luafile ~/.config/nvim/lua/user/undotree.lua
luafile ~/.config/nvim/lua/user/neoscroll.lua
luafile ~/.config/nvim/lua/user/toggleterm.lua

" markdown
luafile ~/.config/nvim/lua/user/vimwiki.lua
luafile ~/.config/nvim/lua/user/instant-markdown.lua

" keymaps
luafile ~/.config/nvim/lua/user/keymaps-custom.lua
luafile ~/.config/nvim/lua/user/whichkey.lua

" nvim-lsp
luafile ~/.config/nvim/lua/user/lsp/init.lua
luafile ~/.config/nvim/lua/user/trouble.lua
luafile ~/.config/nvim/lua/user/gitsigns.lua

" nvim-cmp
luafile ~/.config/nvim/lua/user/cmp.lua

" telescope file-exp
luafile ~/.config/nvim/lua/user/telescope.lua

"treesitter
luafile ~/.config/nvim/lua/user/treesitter.lua
luafile ~/.config/nvim/lua/user/autopairs.lua
luafile ~/.config/nvim/lua/user/autotag.lua
luafile ~/.config/nvim/lua/user/comment.lua

" Git
luafile ~/.config/nvim/lua/user/lazygit.lua
