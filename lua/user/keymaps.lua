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

-- insert mode using JK
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)

-- basic - save - quit
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-q>", ":wq!<CR>", opts)
keymap("n", "<C-c>", "<ESC>", opts)

-- delete buffer
keymap("n", "wq", ":Bdelete<cr>", opts)

-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- windows resize panes
keymap("n", "<M-j>", ":resize -2<CR>", opts)
keymap("n", "<M-k>", ":resize +2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize +2<CR>", opts)

-- nvim tree toggle
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "q", ":NvimTreeClose<CR>", opts)

-- navigate buffer
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- tmux navigatior
keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", term_opts)
keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", term_opts)
keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", term_opts)
keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", term_opts)

vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 2
vim.g.tmux_navigator_disable_when_zoomed = 1
vim.g.tmux_navigator_preserve_zoom = 1

-- indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-J>", ":move '>+1<CR>gv-gv", opts) -- S -> example : shift -> j
keymap("v", "<S-K>", ":move '<-2<CR>gv-gv", opts) -- up

-- go to specified buffer
keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts)

-- telescope
-- keymap("n", "<M-p>", ":Telescope find_files<cr>", opts) -- default find_files layout
keymap("n", "FF", "<cmd>lua require('user.telescope').unicorns_search()<CR>", opts)
keymap("n", "FO", "<cmd>lua require('user.telescope').unicorns_project()<CR>", opts)
keymap("n", "FH", "<cmd>lua require('user.telescope').unicorns_bookmarks()<CR>", opts)
keymap("n", "FS", "<cmd>lua require('user.telescope').unicorns_grep()<CR>", opts)
keymap("n", "FN", "<cmd>lua require('user.telescope').unicorns_browser()<CR>", opts)
keymap("n", "FP", "<cmd>Telescope packer<CR>", opts)

-- todo notes
keymap("n", "qq", "<cmd>TroubleClose<cr>", opts)
keymap("n", "tj", "<cmd>TodoTrouble<cr>", opts)

-- remove history seach text
keymap("n", "<S-r>", ":noh<cr>", opts)

-- undotree
keymap("n", "<C-p>", ":UndotreeToggle<CR>", opts)

-- markdown-preview
keymap("n", "<M-o>", ":InstantMarkdownPreview<CR>", opts)

-- FIX weird thing
keymap("n", "mm", "zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)
