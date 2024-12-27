-- lua/cmp_lsp.lua
local M = {}

M.setup = function()
  local ok, cmp = pcall(require, 'cmp')
  if not ok then
    vim.notify("nvim-cmp not installed", vim.log.levels.ERROR)
    return
  end

  -- Optionally load VSCode-style snippets (including Elixir, JS, etc.)
  local luasnip_ok, luasnip = pcall(require, 'luasnip')
  if luasnip_ok then
    require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/snippets" } })
    require('luasnip.loaders.from_vscode').lazy_load()
  end

  -- Basic nvim-cmp setup
  cmp.setup({
    snippet = {
      expand = function(args)
        if luasnip_ok then
          luasnip.lsp_expand(args.body)
        end
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if luasnip_ok and luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump() -- Navigate within snippets first
        elseif cmp.visible() then
          cmp.select_next_item() -- Show auto-completion next
        else
          fallback() -- Fall back to default Tab behavior
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip_ok and luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    }),
  })

  -- Setup cmdline completion (search `/`)
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  -- Setup cmdline completion (commands `:`)
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
  })
end

-- Export the cmp_nvim_lsp capabilities so other files can use them.
M.capabilities = require('cmp_nvim_lsp').default_capabilities()

return M

