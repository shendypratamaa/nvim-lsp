require('bufferline').setup {
  options = {
    numbers = function(opts)
     return string.format('%s', opts.lower(opts.ordinal))
    end,
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator_icon = '',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)  
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
   offsets = {
      {
      filetype = "tree",
      text = function()
        return vim.fn.getcwd()
      end,
      highlight = "Directory",
      text_align = "center"
      }
    },
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 20,
    diagnostics = "diagnostics",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    custom_filter = function(buf_number)
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
    end,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = false,
    persist_buffer_sort = false,
    separator_style = { '  ', '  ' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = "id",
  }
}
