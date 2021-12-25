local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local opts = {
    -- on_attach = require('user.lsp.handler').on_attach,
    -- capabilities = require('user.lsp.handler').capabilities
  }
    -- if server_name == "tsserver" then
    --   local tsserver = require('user.lsp.settings.tsserver')
    --   opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    -- end

    -- if server_name == "jsonls" then
    --   local jsonls = require('user.lsp.settings.jsonls')
    --   opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
    -- end
server:setup(opts)
end)

local lsp_installer_servers = require'nvim-lsp-installer.servers'

local server_available, requested_server = lsp_installer_servers.get_server("rust_analyzer")
if server_available then
    requested_server:on_ready(function ()
        local opts = {}
        requested_server:setup(opts)
    end)
    if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
    end
end

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
