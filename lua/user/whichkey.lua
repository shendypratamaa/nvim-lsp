local status_ok, which_key = pcall(require, "which-key")

if not status_ok then
  return
end
local wk = which_key

local setup = {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 3, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 10, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local keybinds = {
  D = { "<cmd>:Bdelete<cr>", "Delete Buffer" },
  s = { "<cmd>:w!<cr>", "Save Files" },
  q = { "<cmd>:wq!<cr>", "Quit Save" },
  v = { "<C-w>s<cr>", "Split Horizontal" },
  V = { "<C-w>v<cr>", "Split Vertical" },
  n = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  L = {
    name = "+LSP 🤖",
    h = { "<cmd>LspInfo<cr>", "Lsp Information" },
    j = { "<cmd>LspInstallInfo<cr>", "Lsp Installer Info" },
    n = { "<cmd>NullLsLog<cr>", "Null Ls Log" },
  },
  G = {
    name = "+GIT 🚀",
    g = { "<cmd>LazyGit<CR>", "Lazy git" },
    j = { "<cmd>lua require'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require'gitsings'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
  },
  F = {
    name = "+TELESCOPE 🔭",
    f = { "<cmd>lua require'user.telescope'.unicorns_search()<cr>", "Find Files" },
    b = { "<cmd>lua require'user.telescope'.unicorns_buffers()<cr>", "Buffer Files" },
    p = { "<cmd>lua require'user.telescope'.unicorns_project()<cr>", "Project Files" },
    w = { "<cmd>lua require'user.telescope'.unicorns_browser()<cr>", "Files browser" },
    a = { "<cmd>lua require'user.telescope'.unicorns_bookmarks()<cr>", "Bookmarks Browser" },
    e = { "<cmd>Telescope packer<cr>", "Plugins Information" },
    l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Help Files" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme List" },
    s = { "<cmd>Telescope git_status<cr>", "Open Change File" },
    r = { "<cmd>Telescope git_branches<cr>", "Checkout Branch" },
    o = { "<cmd>Telescope git_commits<cr>", "Checkout Commit" },
    d = { "<cmd>TodoTelescope<cr>", "Find Todo" },
  },
  X = {
    name = "+TROUBLE 🚑",
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quick Fix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "Loc List" },
  },
}

wk.setup(setup)
wk.register(keybinds, opts)
