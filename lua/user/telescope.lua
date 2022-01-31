local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local telescope_builtin = require "telescope.builtin"
local telescope_themes = require "telescope.themes"

local previewers = require "telescope.previewers"
local Job = require "plenary.job"
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job
    :new({
      command = "file",
      args = { "--mime-type", "-b", filepath },
      on_exit = function(j)
        local mime_type = vim.split(j:result()[1], "/")[1]
        if mime_type == "text" then
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        else
          vim.schedule(function()
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "DONT SHOWING BINARY !" })
          end)
        end
      end,
    })
    :sync()
end

local M = {}

local preview_themes = {
  show_line = false,
  results_title = false,
  preview_title = false,
  shorten_path = true,
  layout_config = {
    preview_width = 0.5,
  },
}

local preview_ivy = telescope_themes.get_ivy {
  shorten_path = true,
  layout_config = {
    height = 0.4,
  },
}

M.unicorns_search = function()
  local opts = vim.deepcopy(preview_themes)
  opts.prompt_title = "< 🦄 Find Files >"
  telescope_builtin.find_files(opts)
end

M.unicorns_buffers = function()
  local opts = vim.deepcopy(preview_themes)
  opts.prompt_title = "< 🦄 Find Buffers >"
  telescope_builtin.buffers(opts)
end

M.unicorns_browser = function()
  local opts = vim.deepcopy(preview_ivy)
  opts.prompt_title = "< 🦄 File Browse >"
  telescope.extensions.file_browser.file_browser(opts)
end

M.unicorns_bookmarks = function()
  local opts = vim.deepcopy(preview_ivy)
  opts.selected_browser = "brave"
  opts.prompt_title = "< 🦄 Bookmarks Browser >"
  telescope.extensions.bookmarks.bookmarks(opts)
end

M.unicorns_project = function()
  local opts = telescope_themes.get_dropdown {}
  opts.display_type = "full"
  opts.prompt_title = "< 🦄 Project Directory >"
  telescope.extensions.project.project(opts)
end

M.unicorns_grep = function()
  local opts = vim.deepcopy(preview_themes)
  opts.layout_config = {
    preview_width = 0.4,
  }
  opts.prompt_title = "< 🦄 Live Grep >"
  opts.grep_open_files = true
  telescope_builtin.live_grep(opts)
end

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node%_modules/.*" },
    buffer_previewer_maker = new_maker,
    prompt_prefix = "🔭 ",
    selection_caret = "🚀 ",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

        ["<C-l>"] = actions.complete_tag,
        ["<C-]>"] = actions.which_key,
      },

      n = {
        ["<C-c>"] = actions.close,
        ["q"] = actions.close,

        ["<CR>"] = actions.select_default,

        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_node = "smart_case",
    },
    packer = {
      theme = "ivy",
      layout_config = {
        height = 0.5,
      },
    },
  },
}

telescope.load_extension "fzf"
telescope.load_extension "project"
telescope.load_extension "file_browser"
telescope.load_extension "emoji"
telescope.load_extension "notify"
telescope.load_extension "packer"
telescope.load_extension "bookmarks"
telescope.load_extension "harpoon"

return M
