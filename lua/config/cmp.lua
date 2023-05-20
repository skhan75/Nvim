local M = {}

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
 return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
 return
end

local check_backspace = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

function M.setup()
  local has_any_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
      return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  end

  local press = function(key)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
  end

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  cmp.setup {
    formatting = {
      format = require("lspkind").cmp_format {
        with_text = true,
        menu = {
          nvim_lsp = "[LSP]",
          buffer = "[Buffer]",
          nvim_lua = "[Lua]",
          treesitter = "[treesitter]",
          look = "[Look]",
          path = "[Path]",
          spell = "[Spell]",
          calc = "[Calc]",
          emoji = "[Emoji]",
          neorg = "[Neorg]",
        },
      },
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` user.
      end,
    },
    window = {
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
    },
    completion = {
      border = "rounded",
      winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    },
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<m-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<C-c>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      ["<m-j>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      ["<m-k>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      ["<m-c>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      ["<S-CR>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = false },
      ["<Right>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.jumpable(1) then
          luasnip.jump(1)
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif check_backspace() then
          -- cmp.complete()
          fallback()
        else
          fallback()
        end
      end, {
          "i",
          "s",
        }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
          "i",
          "s",
        }),
    },
    sources = {
      { name = "nvim_lsp", max_item_count = 10, group_index = 1 },
      { name = "nvim_lua", max_item_count = 5, group_index = 1 },
      {
        name = "copilot",
        max_item_count = 3,
        trigger_characters = {
          {
            ".",
            ":",
            "(",
            "'",
            '"',
            "[",
            ",",
            "#",
            "*",
            "@",
            "|",
            "=",
            "-",
            "{",
            "/",
            "\\",
            "+",
            "?",
            " ",
            -- "\t",
            -- "\n",
          },
        },
        group_index = 2,
      },
      { name = "luasnip", max_item_count = 5, group_index = 1},
      { name = "buffer", keyword_length = 5, max_item_count = 5, group_index = 2 },
      { name = "path", group_index = 2 },
      { name = "treesitter", max_item_count = 10, group_index = 2 },
      { name = "crates", group_index = 2 },
      -- { name = "cmp_openai_codex" },
      -- { name = "emoji" },
      -- { name = "neorg" },
      -- { name = "look" },
      -- { name = "calc" },
      -- { name = "spell" },
      -- { name = "cmp_tabnine" },
    },
    experimental = { ghost_text = true }, 
  }
end

return M
