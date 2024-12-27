local nvim_lsp = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Initialize Mason
mason.setup()

-- Ensure servers are installed
mason_lspconfig.setup({
  ensure_installed = {
    'ts_ls',
    'eslint',
    'jsonls',
    'html',
    'cssls',
    'pyright',
    'gopls',
    'jdtls',
    'lua_ls',
    'clangd',
    'elixirls',
  },
})

-- Common on_attach function to map LSP-related keybindings after LSP server attaches to current buffer
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  -- LSP Keybindings
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gk', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

-- Set up each server once Mason has initialized
mason_lspconfig.setup_handlers {
  function(server_name)
    local config = {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      capabilities = capabilities,
    }

    -- Custom handler for ts_ls to suppress specific warnings
    if server_name == "ts_ls" then
      config.handlers = {
        ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
          result.diagnostics = vim.tbl_filter(function(diagnostic)
            -- Suppress warnings for missing module declarations
            return not diagnostic.message:match("Could not find a declaration file for module")
            -- Suppress warnings for CommonJS module conversion suggestion
              and not diagnostic.message:match("it may be converted to an ES module")
          end, result.diagnostics)
          vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
        end,
      }

    elseif server_name == "eslint" then
      -- Fix on save for ESLint
      config.on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end
      config.settings = {
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = "separateLine",
          },
          showDocumentation = {
            enable = true,
          },
        },
      }

    elseif server_name == "lua_ls" then
      -- Lua language server for Neovim development
      config.settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false },
        },
      }

    elseif server_name == "elixirls" then
      config.cmd = { "/opt/homebrew/bin/elixir-ls" }
      config.settings = {
        elixirLS = {
          dialyzerEnabled = true,
          fetchDeps = false,
        },
      }
    end

    nvim_lsp[server_name].setup(config)
  end,
}
