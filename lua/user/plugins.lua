local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim when you save plugins.lua and compile it ready to PackerInstall
-- why im not using autocommand PackerSync because i dont want to update everytime
-- sometime new update from sources, not fully clear, maybe breaking changes
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    opt_default = true,
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    working_sym = "🧛",
    error_sym = "🧨",
    done_sym = "🦄",
    removed_sym = "🚑",
    moved_sym = "🚀",
    header_sym = "━",
    show_all_info = true,
    prompt_border = "rounded",
  },
}

-- this is bug when using ftdetect from json to jsonc
-- if autocmd load after plugins startup we must open file jsonc first
-- but if we reattach from filetype json to jsonc commenters will be broken
-- this is the solution where i founded, before treesitter / lspconfig fix this
vim.cmd [[autocmd BufNewFile,BufRead tsconfig*.json setlocal filetype=jsonc]]

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins

  use "wbthomason/packer.nvim"

  -- Nvim-lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "ray-x/lsp_signature.nvim"
  use "folke/trouble.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use { "ray-x/navigator.lua", requires = { "ray-x/guihua.lua", run = "cd lua/fzy && make" } }

  -- Git
  use "kdheepak/lazygit.nvim"
  use "lewis6991/gitsigns.nvim"

  -- Keys
  use "folke/which-key.nvim"

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "saadparwaiz1/cmp_luasnip"
  use "nvim-lua/plenary.nvim"
  use "tpope/vim-surround"

  -- Cmp completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-emoji"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    commit = "c81382328ad47c154261d1528d7c921acad5eae5",
  }
  use "RRethy/nvim-treesitter-textsubjects"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "numToStr/Comment.nvim"
  use "shendypratamaa/nvim-ts-rainbow"
  use "SmiteshP/nvim-gps"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-project.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "xiyaowong/telescope-emoji.nvim"
  use "nvim-telescope/telescope-packer.nvim"
  use "dhruvmanila/telescope-bookmarks.nvim"
  use "ThePrimeagen/harpoon"

  -- telescope utils extended
  use "airblade/vim-rooter"

  -- Colorscheme
  use "folke/tokyonight.nvim"
  use "Mofiqul/dracula.nvim"
  use "bluz71/vim-nightfly-guicolors"
  use "rebelot/kanagawa.nvim"
  use "sainnhe/gruvbox-material"
  use "catppuccin/nvim"

  -- Themes - Utils
  use "nvim-lualine/lualine.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  use "akinsho/bufferline.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "goolord/alpha-nvim"
  use "christoomey/vim-tmux-navigator"
  use "mbbill/undotree"
  use "karb94/neoscroll.nvim"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "petertriho/nvim-scrollbar"
  use "antoinemadec/FixCursorHold.nvim"
  use "nacro90/numb.nvim"
  use "shendypratamaa/pretty-fold.nvim"
  use "ggandor/lightspeed.nvim"
  use "folke/twilight.nvim"
  use "folke/zen-mode.nvim"
  use "rcarriga/nvim-notify"
  use "folke/todo-comments.nvim"

  -- notes-takingapp
  use "nvim-neorg/neorg"
  use "vimwiki/vimwiki"
  use {
    "instant-markdown/vim-instant-markdown",
    ft = "markdown",
    run = "yarn install",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
