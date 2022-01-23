-- vim.g.nvim_tree_git_hl = 0
-- vim.g.nvim_tree_highlight_opened_files = 1

vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_refresh_wait = 200
vim.g.nvim_tree_change_dir_global = 1

vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_symlink_arrow = " >> "
vim.g.nvim_tree_root_folder_modifier = ":r"

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
  auto_close = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  open_on_tab = true,
  hijack_cursor = false,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    side = "left",
    auto_resize = true,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "V", cb = tree_cb "vsplit" },
        { key = "v", cb = tree_cb "split" },
      },
    },
  },
  filters = {
    dotfiles = true,
    custom = {},
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}
