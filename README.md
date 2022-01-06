# Neovim-Lsp

*this is repo migration from nvimscript* 🛸
*notes : moving native support, from coc-nvim to native lsp* 🚀

## Whatever you want to call this 🌈
> feel free to clone this 📦
> feel free to edit all configuration, based on this configuration 🧛
> this repo include tmux, alacritty configuration inside extras folder
> running on macos 12.1, neovim 0.6.0, alacritty 0.9.0, tmux 3.2a

## Requirement
1. [Neovim](https://github.com/neovim/neovim)
2. [Tmux](https://github.com/tmux/tmux)
3. Optional [Alacritty](https://github.com/alacritty/alacritty)

### Structure file 📺
![15.png](/sources/15.png) 🚧
> neovim lua, structure files
> not purely lua, package installer still using vimsript, read for more [Vim-Plug](https://github.com/junegunn/vim-plug)

### Dashboard Section 📠
![1.png](/sources/1.png)
- **Features** 💅
> Navigate whatever you want, you can edit inside lua/user/dashboard.lua
> default setting, for find files, add new files based on directory main, recent open files, find text / live grep and jump to vimwiki, configuration for neovim, alacritty, zshell, dashboard,
> read for more [Alpha](https://github.com/goolord/alpha-nvim)

### Editor Section 📡
![5.png](/sources/5.png)
- **Features**
> Left side is navigation bar like based text editor, but u can more customize, with ur preferences,
> this is using [Nvim-Tree](https://github.com/kyazdani42/nvim-tree.lua) and icon using [Nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
> Right side is buffer for information for Undo actions, this is really cools stuff from [UndoTree](https://github.com/mbbill/undotree) we can undo without worry
> UndoTree when we close Neovim this plug can still save cache history editing inside every single buffer where we edit
> Main pane its place where we can write code, colorscheme ? [Nightfky](https://github.com/bluz71/vim-nightfly-guicolors)

### Multiple Panes 🖼
![9.png](/sources/9.png)
> easy split Multiple panes, vertical or horizontal, and easy to rearangement every panes
> colorfull indentline [Indentline](https://github.com/lukas-reineke/indent-blankline.nvim)
> keybinding for moving to every single panes using <C-?> hjkl 💯 inside neovim or tmux,

### Diagnostics Error 🔎
![10.png](/sources/10.png)
> i'm moving from coc-nvim to native lsp, bcs much more configuration for making faster than before, and support lua programming
> virtual text true, showing realtime error based on timeoutlen on setting vimrc
![13.png](/sources/13.png)
> if we setting to false, we can using toggle just only showing icon for every line error and showup hint for fix this
![6.png](/sources/6.png)
> this configuration fully support for type cheking, diagnostics, completion for every programming language, etc
> don't forget to chek [PlugInstallaation](/vimscript/vim-plug/plug.vim)

### Lazy Git 🛠
> another cools stuf is lazygit, this is interface where we can looking and creating and much more for add, commit, change branches, resolve confict and etc.
> read more [Lazygit](https://github.com/kdheepak/lazygit.nvim)

### Telescope 🔭
> read for more [Telescope](https://github.com/nvim-telescope/telescope.nvim)
> using telescope with live grep for search specified files in directory, make easy to navigation just type filename

### Whickey 💡
> tomany keybinding make brains burningout actually 🤖
> with [Whickey](https://github.com/folke/which-key.nvim) we still can using function without fully type keybind just only press mapleader where i'm setting as a space


### Still Update 🐼
