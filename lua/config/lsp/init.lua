local M = {}
local servers = {
  "tsserver",
  "lua_ls",
  "rust_analyzer",
  "pyright",
  "jdtls",
  "eslint",
  "clangd",
  "html",
  "bashls",
  "cssls",
  "cssmodules_ls",
}

local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local function setup_mason()
  local mason_settings = {
    ui = {
      border = "rounded",
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
      },
      automatic_installation = true,
      max_concurrent_installers = 4,
    },
  }

  -- Setup up mason settings
  mason.setup(mason_settings)


  -- Set up Mason Servers 
  mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
  }
end

local function setup_servers()
  mason_lspconfig.setup_handlers({
    function(server)
      lspconfig[server].setup({})
    end,
    ['tsserver'] = function(server)
      local tsserver_opts = require "config.lsp.settings.tsserver"
      lspconfig[server].setup(tsserver_opts)
    end,
    ['pyright'] = function(server)
      local pyright_opts = require "config.lsp.settings.pyright"
      lspconfig[server].setup(pyright_opts)
    end,
    ['jsonls'] = function(server)
      local jsonls_opts = require "config.lsp.settings.jsonls"
      lspconfig[server].setup(jsonls_opts)
    end,
    -- ['lua_ls'] = function(server)
    --   local l_status_ok, lua_dev = pcall(require, "lua-dev")
    --   if not l_status_ok then
    --     return
    --   end
    --   local luadev = lua_dev.setup {
    --     lspconfig = {
    --       on_attach = opts.on_attach,
    --       capabilities = opts.capabilities,
    --     },
    --   }
    -- end,
    -- ['jdtls'] = function(server)
    --   local jdtls_opts = require "config.lsp.settings.jdtls"
    --   lspconfig[server].setup(jdtls_opts)
    -- end,
    -- ['rust_analyzer'] = function(server)
    --   local rust_opts = require "config.lsp.settings.rust"
    --   lspconfig[server].setup(rust_opts)
    --   local rust_tools_status_ok, rust_tools = pcall(require,"rust-tools")
    --   if not rust_tools_status_ok then
    --     return
    --   end
    --   rust_tools.setup(rust_opts)
    -- end,
  })
end

function M.setup()
  setup_mason()
  setup_servers()
end

return M
