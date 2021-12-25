local enabled_list = {'vim', 'lua','javascript', 'javascriptreact', 'typescriptreact', 'typescript'}
local parsers = require('nvim-treesitter.parsers')
require'nvim-treesitter.configs'.setup({
  ensure_installed = "maintained",
  ignore_install = { "haskel" },
  highlight = {
    enable = true,
    disable = { "c", "rust"},
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
    filetypes = {'html', 'javascript', 'javascriptreact', 'typescriptreact'},
    skip_tags = {
      'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
      'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
    }
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  },
  rainbow = {
    enable = true,
    disable = vim.tbl_filter(
      function(p)
          local disable = true
          for _, lang in pairs(enabled_list) do
            if p==lang then disable = false end
          end
          return disable
      end,
      parsers.available_parsers()
    )
  }
})
