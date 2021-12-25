if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " migrate to nvim-lspconfig
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'

  " snippets
  Plug 'folke/trouble.nvim'

  
  " utils - themes - extentions
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'

  Plug 'christoomey/vim-tmux-navigator'
  Plug 'liuchengxu/vim-which-key'
  Plug 'akinsho/bufferline.nvim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'tpope/vim-commentary'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'christianchiarulli/nvcode-color-schemes.vim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'simeji/winresizer'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'windwp/nvim-ts-autotag'
  Plug 'jiangmiao/auto-pairs'
  Plug 'nvim-lua/plenary.nvim'

" collaborator
  Plug 'kdheepak/lazygit.nvim'

" search
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()
