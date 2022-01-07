# Neovim-lspconfig 🐣
*This is repo migration from nvimscript* 🛸
*notes : moving native support, from coc-nvim to native lsp* 🚀
## Whatever you want to call this 🌈
> Feel free to clone this 📦<br>
  Feel free to edit all configuration, based on this configuration 🧛,

* Repo include
  * Noevim ready to go 🐥,
  * Tmux config inside extras folder,
  * Alacritty config inside extras folder

* Running on :
  * Macos 12.1,
  * Neovim 0.6.0,
  * Alacritty 0.9.0,
  * Tmux 3.2a
## Requirement
> I don't know how to configure on windows os 🚧
1. [Neovim](https://github.com/neovim/neovim)
2. [Tmux](https://github.com/tmux/tmux)
3. [Alacritty](https://github.com/alacritty/alacritty)
### Dashboard Section 📠
<p align="center">
  <img src="/sources/1.png"/>
</p>

* Navigate whatever you want, you can edit inside lua/user/dashboard.lua
* Default setting, for my configuration i'm using for find files, add new files based on directory main, recent open files, find text / live grep and jump to vimwiki, configuration for neovim, alacritty, zshell, dashboard
* Read for more [Alpha](https://github.com/goolord/alpha-nvim)
### Editor Section 📡
<p align="center">
  <img src="/sources/5.png"/>
</p>

* Left side is navigation bar like based text editor, but u can more customize, with ur preferences,
* This is using [Nvim-Tree](https://github.com/kyazdani42/nvim-tree.lua) and icon using [Nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons),
* Right side is buffer for information for Undo actions, this is really cool stuff from [UndoTree](https://github.com/mbbill/undotree) we can undo without worry 🌲
* UndoTree when we close Neovim this plug can still have cache of the file 💾
* Main pane its place where we can write code, Colorscheme ? [Nightfly](https://github.com/bluz71/vim-nightfly-guicolors)
### Multiple Panes 🖼
<p align="center">
  <img src="/sources/9.png"/>
</p>

* Easy split multiple panes, vertical or horizontal, and easy to arrangement every panes 👯
* Colorfull indentline [Indentline](https://github.com/lukas-reineke/indent-blankline.nvim) 💅
* Keybinding for moving to every single panes using <C-?> hjkl 💯 inside neovim or tmux 🔑
### Diagnostics Error 🔎
<p align="center">
  <img src="/sources/10.png"/>
</p>

* I'm moving from coc-nvim to native-lsp, because much more configuration for making faster than before, and support lua programming
* Virtual text true, showing real time error based on timeoutlen on setting vimrc
<p align="center">
  <img src="/sources/13.png" />
</p>

* If setting to false, we can access toggle just only showing icon for every line error and displaying on a screen of hint for fix this
<p align="center">
  <img src="/sources/6.png" />
</p>

* This configuration fully support for type checking, diagnostics, completion for every programming language, just add specified language
* Don't forget to check [PlugInstall](/vimscript/vim-plug/plug.vim)
### Lazy Git 🛠
<p align="center">
  <img src="/sources/12.png" />
</p>

* Another cool stuf is lazygit, this is interface where we can look and creating and much more for add, commit, change branches, resolve confict and etc.
* Read more [Lazygit](https://github.com/kdheepak/lazygit.nvim)
### Telescope 🔭
<p align="center">
  <img src="/sources/11.png" />
</p>

* Read for more [Telescope](https://github.com/nvim-telescope/telescope.nvim)
* Using telescope with live grep for search specified files in directory, make easy to navigation just type filename
### Whickey 💡
<p align="center">
  <img src="/sources/8.png" />
</p>

* Save brain capacity for every keystroke 🧠
* With [Whickey](https://github.com/folke/which-key.nvim) we can easy using keybinding with another binding as a single character execution 📡
### Structure file 📺
* Directory `$HOME/.config/nvim/`
* Run cmd vim `:PlugInstall`

<p align="left">
  <img src="/sources/15.png" width="200"/>
</p>

* Neovim lua, structure files 💿
* Not purely using lua, package installer still using vimscript,
* Read for more [Vim-Plug](https://github.com/junegunn/vim-plug) 🦖

### Still Maintained 🦄
