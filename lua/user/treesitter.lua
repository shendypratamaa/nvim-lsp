local status_ok, treeSitter = pcall(require, 'nvim-treesitter.config')

if not status_ok then
  return
end

local filetypes = {'vim', 'lua','javascript', 'javascriptreact', 'typescriptreact', 'typescript'}

local parsers = require('nvim-treesitter.parsers')

treeSitter.setup({
  ensure_installed = "maintained",
  ignore_install = { "haskel" },
  sync_install = false,
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
    filetypes = { filetypes },
    skip_tags = {
      'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
      'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
    }
  },
  rainbow = {
    enable = true,
    disable = vim.tbl_filter(
      function(p)
          local disable = true
          for _, lang in pairs(filetypes) do
            if p==lang then disable = false end
          end
          return disable
      end,
      parsers.available_parsers()
    )
  },
  indent = { 
    enable = true,
    disable = { 
      "yaml", 
      "yml" 
    },
  },
})
