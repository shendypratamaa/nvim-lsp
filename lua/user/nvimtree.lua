vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_change_dir_global = 1
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_icon_padding = " "
vim.g.nvim_tree_symlink_arrow = " >> "
vim.g.nvim_tree_respect_buf_cwd = 0
vim.g.nvim_tree_create_in_closed_folder = 0
vim.g.nvim_tree_refresh_wait = 100
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    "notify",
    "packer",
    "qf",
  },
  buftype = {
    "terminal",
  },
}

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

local status_ok, nvimtree = pcall(require, "nvim-tree")
local config_ok, nvimtreeconfig = pcall(require, "nvim-tree.config")
if not status_ok and config_ok then
  return
end

local tree_cb = nvimtreeconfig.nvim_tree_callback

nvimtree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = { ".git", "node_modules", ".cache" },
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = { ".git", "node_modules", ".cache" },
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = true,
    custom = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 300,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "V", cb = tree_cb "vsplit" },
        { key = "v", cb = tree_cb "split" },
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = { "O" }, action = "edit_no_picker" },
        { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
        { key = "<C-v>", action = "vsplit" },
        { key = "<C-x>", action = "split" },
        { key = "<C-t>", action = "tabnew" },
        { key = "<", action = "prev_sibling" },
        { key = ">", action = "next_sibling" },
        { key = "P", action = "parent_node" },
        { key = "<BS>", action = "close_node" },
        { key = "<Tab>", action = "preview" },
        { key = "K", action = "first_sibling" },
        { key = "J", action = "last_sibling" },
        { key = "I", action = "toggle_ignored" },
        { key = "H", action = "toggle_dotfiles" },
        { key = "<M-t>", action = "refresh" },
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "D", action = "trash" },
        { key = "r", action = "rename" },
        { key = "<C-r>", action = "full_rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "[c", action = "prev_git_item" },
        { key = "]c", action = "next_git_item" },
        { key = "-", action = "dir_up" },
        { key = "s", action = "system_open" },
        { key = "q", action = "close" },
        { key = "g?", action = "toggle_help" },
      },
    },
    number = true,
    relativenumber = true,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}
