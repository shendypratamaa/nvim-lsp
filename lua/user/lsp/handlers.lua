local status_ok, navigator = pcall(require, "navigator")
local status_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local status_notify, notification = pcall(require, "notify")

local path = require "nvim-lsp-installer.path"
local install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" }

local custom_signature = require "user.lsp.lsp-signature"
local jsonschemas = require "user.lsp.settings.jsonls"

if not status_ok and status_cmp and status_notify then
  notification(status_ok or status_cmp or status_notify .. "not loaded !", "error")
  return
end

local M = {}

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()

        hi default GHTextViewDark guifg=#DCD7BA guibg=#3c3836
        hi default GHListDark guifg=#C8C093 guibg=#504945
        hi default GHListHl guifg=#C8C093 guibg=#32302f
        hi NormalFloat guibg=#32302f
        hi FloatBorder guibg=#32302f
      augroup END
     ]],
      false
    )
  end
end

local function lspsignature_help(bufnr)
  local lsp_signature = require "lsp_signature"

  lsp_signature.setup { custom_signature }
  lsp_signature.on_attach(custom_signature, bufnr)
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap

  -- Telescope
  keymap(bufnr, "n", "<C-n>", "<cmd>lua require('user.telescope').unicorns_search()<CR>", opts)
  keymap(bufnr, "n", "FE", "<cmd>lua require('user.telescope').unicorns_buffers()<CR>", opts)
  keymap(bufnr, "n", "FU", "<cmd>lua require('user.telescope').unicorns_browser()<CR>", opts)
  keymap(bufnr, "n", "FD", "<cmd>lua require('user.telescope').unicorns_project()<CR>", opts)
  keymap(bufnr, "n", "FH", "<cmd>lua require('user.telescope').unicorns_bookmarks()<CR>", opts)
  keymap(bufnr, "n", "FJ", "<cmd>Telescope packer<CR>", opts)

  -- LspKeymap
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "<C-m>", "<cmd>IndentBlanklineToggle<CR>", opts)
  keymap(bufnr, "n", "ZZ", "<cmd>lua require('zen-mode').toggle()<CR>", opts)

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_sync()]]
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
  lspsignature_help(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolvedSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

M.setup = function()
  navigator.setup {
    debug = false,
    width = 0.7,
    height = 0.4,
    preview_height = 0.4,
    preview_lines = 40,
    preview_lines_before = 15,
    default_mapping = false,
    keymaps = {
      { key = "<C-]>", func = "require('navigator.definition').definition()" },
      { key = "RE", func = "require('navigator.reference').reference()" },
      { key = "g0", func = "require('navigator.symbols').document_symbols()" },
      { key = "gt", func = "require('navigator.treesitter').buf_ts()" },
      { key = "gT", func = "require('navigator.treesitter').bufs_ts()" },
      { key = "ga", mode = "n", func = "require('navigator.codeAction').code_action()" },
      { key = "gA", mode = "v", func = "range_code_action()" },
      { key = "RR", func = "require('navigator.rename').rename()" },
      { mode = "i", key = "<C-k>", func = "signature_help()" },
      { key = "gk", func = "signature_help()" },
      { key = "gD", func = "declaration({ border = 'rounded', max_width = 80 })" },
      { key = "K", func = "hover({ popup_opts = { border = single, max_width = 80 }})" },
      { key = "GJ", func = "require('navigator.definition').definition_preview()" },
      { key = "gi", func = "incoming_calls()" },
      { key = "gO", func = "outgoing_calls()" },
      { key = "gK", func = "require('navigator.diagnostics').show_buf_diagnostics()" },
      { key = "]r", func = "require('navigator.treesitter').goto_next_usage()" },
      { key = "[r", func = "require('navigator.treesitter').goto_previous_usage()" },
      { key = "[g", func = "require('navigator.dochighlight').hi_symbol()" },
      { key = "le", mode = "n", func = "require('navigator.codelens').run_action()" },
      { key = "gl", func = "require('navigator.diagnostics').show_diagnostics()" },
      -- { key = "GR", func = "require('navigator.reference').async_ref()" }, -- err
      -- { key = "g[", func = "type_definition()" }, -- err
      -- { key = "<Space>wa", func = "require('navigator.workspace').add_workspace_folder()" },
      -- { key = "<Space>wr", func = "require('navigator.workspace').remove_workspace_folder()" },
      -- { key = "<Space>ff", func = "formatting()", mode = "n" },
      -- { key = "<Space>ff", func = "range_formatting()", mode = "v" },
      -- { key = "<Space>wl", func = "require('navigator.workspace').list_workspace_folders()" },
    },
    external = nil,
    border = "rounded",
    lines_show_prompt = 20,
    combined_attach = "both",
    lsp_signature_help = true,
    signature_help_cfg = { custom_signature },
    on_attach = function(client, bufnr)
      M.on_attach(client, bufnr)
    end,
    ts_fold = false,
    treesitter_analysis = true,
    transparency = 100,
    lsp = {
      code_action = {
        enable = false,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
        virtual_text_icon = true,
      },
      code_lens_action = {
        enable = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
        virtual_text_icon = true,
      },
      format_on_save = false,
      disable_format_cap = { "tsserver", "stylelint_lsp", "sumneko_lua", "jsonls" },
      disable_lsp = { "tailwindcss", "flow" },
      code_lens = false,
      disply_diagnostic_qf = true,
      diagnostic_load_files = false,
      diagnostic_virtual_text = true,
      diagnostic_update_in_insert = false,
      diagnostic_scrollbar_sign = { "▃", "▆", "█" },
      jsonls = {
        settings = {
          json = {
            schemas = jsonschemas,
          },
        },
        cmd = {
          install_root_dir
            .. "/jsonls/node_modules/vscode-langservers-extracted/bin/vscode-json-language-server",
          "--stdio",
        },
        capabilities = capabilities,
      },
      tsserver = {
        cmd = {
          install_root_dir .. "/tsserver/node_modules/typescript-language-server/lib/cli.js",
          "--stdio",
        },
        capabilities = capabilities,
      },
      sumneko_lua = {
        cmd = {
          install_root_dir .. "/sumneko_lua/extension/server/bin/lua-language-server",
          "--stdio",
        },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.stdpath "config" .. "/lua"] = true,
              },
            },
          },
        },
        capabilities = capabilities,
      },
      stylelint_lsp = {
        cmd = {
          install_root_dir .. "/stylelint_lsp/node_modules/stylelint-lsp/dist/index.js",
          "--stdio",
        },
        filetypes = {
          "css",
          "scss",
          "sass",
          "less",
          "postcss",
        },
        capabilities = capabilities,
      },
      pyright = {
        cmd = {
          install_root_dir .. "/python/node_modules/pyright/langserver.index.js",
          "--stdio",
        },
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
              typeCheckingMode = "off",
            },
          },
        },
        capabilities = capabilities,
      },
      tailwindcss = {
        cmd = {
          install_root_dir
            .. "/tailwindcss_npm/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server",
          "--stdio",
        },
      },
      html = {
        cmd = {
          install_root_dir
            .. "/html/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server",
          "--stdio",
        },
      },
      emmet_ls = {
        cmd = {
          install_root_dir .. "/emmet_ls/node_modules/emmet-ls/out/server.js",
          "--stdio",
        },
      },
      cssls = {
        cmd = {
          install_root_dir
            .. "/cssls/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server",
          "--stdio",
        },
      },
      vimls = {
        cmd = {
          install_root_dir .. "/vim/node_modules/vim-language-server/bin/index.js",
          "--stdio",
        },
      },
      servers = {
        "tsserver",
        "sumneko_lua",
        "vimls",
        "jsonls",
        "html",
        "stylelint_lsp",
        "emmet_ls",
        "tailwindcss",
        "cssls",
        "pyright",
      },
    },
    lsp_installer = true,
    icons = {
      icons = true,
      code_action_icon = "🦄",
      code_lens_action_icon = "👓",
      diagnostic_head = "😷",
      diagnostic_err = "📛",
      diagnostic_warn = "🤒",
      diagnostic_info = [[👩]],
      diagnostic_hint = [[💁]],
      diagnostic_head_severity_1 = "👾 ",
      diagnostic_head_severity_2 = "👻 ",
      diagnostic_head_severity_3 = "🎃 ",
      diagnostic_head_description = "🧨 ",
      diagnostic_virtual_text = "🦊 ",
      diagnostic_file = "🚑 ",
      value_changed = "📝 ",
      value_definition = "🦕 ",
      match_kinds = {
        var = "🧛 ",
        method = "🍔 ",
        ["function"] = "🗻 ",
        parameter = "🪂 ",
        associated = "🤝 ",
        namespace = "🚀 ",
        type = "🎹 ",
        field = "🏈 ",
      },
      treesitter_defult = "🌲",
    },
  }
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })
end

return M
