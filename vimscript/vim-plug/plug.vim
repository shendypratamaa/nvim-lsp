if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Nvim-lsp-config
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'tami5/lspsaga.nvim'

  " collaborator
  Plug 'kdheepak/lazygit.nvim'
  Plug 'lewis6991/gitsigns.nvim'

  " snippets
  Plug 'folke/trouble.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'jose-elias-alvarez/null-ls.nvim'

  " cmp plugins
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua'

  " utils - themes - extentions
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'liuchengxu/vim-which-key'
  Plug 'blackCauldron7/surround.nvim'

" search - exps - navigator
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'simeji/winresizer'

call plug#end()
