local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Mode
--    normal_mode = "n"
--    insert_mode = "i"
--    visual_mode = "v"
--    visual_block_mode = "x"
--    term_mode = "t"
--    command_mode = "c"

-- Insert-Mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)

-- Basic - Save - Quit
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-q>", ":wq!<CR>", opts)
keymap("n", "<C-c>", "<ESC>", opts)

-- Delete-buffer
keymap("n", "wq", ":Bdelete<cr>", opts)

-- Window-Navigator
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window-Resize-Pane
keymap("n", "<M-j>", ":resize -2<CR>", opts)
keymap("n", "<M-k>", ":resize +2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize +2<CR>", opts)

-- Remove-hlsearch
keymap("n", "<S-r>", ":noh<cr>", opts)

-- Indent-Mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Navigate-Buffer
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("v", "<S-J>", ":move '>+1<CR>gv-gv", opts) -- S -> example : shift -> j
keymap("v", "<S-K>", ":move '<-2<CR>gv-gv", opts) -- up

-- Nvim-Tree-Toggle
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "q", ":NvimTreeClose<CR>", opts)

-- Fix-behave
keymap("n", "mm", "zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- INFO: Below this line, keybind from plugins

-- Tmux-navigatior
keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", term_opts)
keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", term_opts)
keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", term_opts)
keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", term_opts)

vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 2
vim.g.tmux_navigator_disable_when_zoomed = 1
vim.g.tmux_navigator_preserve_zoom = 1

-- Go-Buffer
keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts)

-- Telescope
-- keymap("n", "<M-p>", ":Telescope find_files<cr>", opts) -- default find_files layout
keymap("n", "FF", "<cmd>lua require('user.telescope').unicorns_search()<CR>", opts)
keymap("n", "FO", "<cmd>lua require('user.telescope').unicorns_project()<CR>", opts)
keymap("n", "FH", "<cmd>lua require('user.telescope').unicorns_bookmarks()<CR>", opts)
keymap("n", "FS", "<cmd>lua require('user.telescope').unicorns_grep()<CR>", opts)
keymap("n", "FN", "<cmd>lua require('user.telescope').unicorns_browser()<CR>", opts)
keymap("n", "FP", "<cmd>Telescope packer<CR>", opts)

-- Todo-Notes
keymap("n", "qq", "<cmd>TroubleClose<cr>", opts)
keymap("n", "tj", "<cmd>TodoTrouble<cr>", opts)

-- Undo-Tree
keymap("n", "<C-p>", ":UndotreeToggle<CR>", opts)

-- Markdown-preview
keymap("n", "<M-o>", ":InstantMarkdownPreview<CR>", opts)

-- Nvim-Treesitter-Playground
keymap("n", "TP", "<cmd>TSPlaygroundToggle<cr>", opts)
