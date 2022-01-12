if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Nvim-lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
  Plug 'ray-x/navigator.lua'

  " Git
  Plug 'kdheepak/lazygit.nvim'
  Plug 'lewis6991/gitsigns.nvim'

  " Keys
  Plug 'folke/which-key.nvim'

  " Snippets
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'tpope/vim-surround'

  " Cmp completion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'shendypratamaa/nvim-ts-rainbow'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'numToStr/Comment.nvim'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

  " Telescope
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  " Colorscheme
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'Mofiqul/dracula.nvim'
  Plug 'bluz71/vim-nightfly-guicolors'

  " Themes - Utils
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'goolord/alpha-nvim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'mbbill/undotree'
  Plug 'karb94/neoscroll.nvim'
  Plug 'moll/vim-bbye'
  Plug 'akinsho/toggleterm.nvim'

  "notes-takingapp
  Plug 'vimwiki/vimwiki'
  Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

call plug#end()
