local M = {}

local servers = {
  "tsserver",
  "sumneko_lua",
  "rust_analyzer",
  "pyright",
  "jdtls",
  "eslint",
  "clangd",
  --    "asm_lsp",
  "html",
  "bashls",
  "cssls",
  "cssmodules_ls",
}

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

  local status_ok, mason = pcall(require, "mason")
  if not status_ok then
    return
  end

  -- Setup up mason settings
  mason.setup(mason_settings)

  local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not status_ok_1 then
    return
  end

  -- Set up Mason Servers 
  mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
  }
end

local function setup_lspconfig()
  local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_status_ok then
    return
  end

  local opts = {}
  local lsputils = require "config.lsp.utils"

  for _, server in pairs(servers) do
    opts = {
      on_attach = lsputils.lsp_attach,
      capabilities = lsputils.get_capabilities(),
    }

    server = vim.split(server, "@")[1]

    if server == "jsonls" then
      local jsonls_opts = require "config.lsp.settings.jsonls"
      opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "tsserver" then
      local tsserver_opts = require "config.lsp.settings.tsserver"
      opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    end

    if server == "pyright" then
      local pyright_opts = require "config.lsp.settings.pyright"
      opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "sumneko_lua" then
      local l_status_ok, lua_dev = pcall(require, "lua-dev")
      if not l_status_ok then
        return
      end
      local luadev = lua_dev.setup {
        lspconfig = {
          on_attach = opts.on_attach,
          capabilities = opts.capabilities,
        },
      }
      lspconfig.sumneko_lua.setup(luadev)
      goto continue
    end

    if server == "jdtls" then
      goto continue
    end

    -- TODO
    -- if server == "rust_analyzer" then
    --     local rust_opts = require "config.lsp.settings.rust"
    --     -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
    --     local rust_tools_status_ok, rust_tools = pcall(require,"rust-tools")
    --     if not rust_tools_status_ok then
    --         return
    --     end

    --     rust_tools.setup(rust_opts)
    --     goto continue
    -- end

    lspconfig[server].setup(opts)
    ::continue::
  end
end

local function setup_servers()
  -- require("config.lsp.null-ls").setup()
  setup_mason()
  setup_lspconfig()
end

function M.setup()
  setup_servers()
end

return M
