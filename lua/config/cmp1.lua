local M = {}

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
 return
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
          ultisnips = "[UltiSnips]",
          vsnip = "[vSnip]",
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
      --expand = function(args)
      --  vim.fn["UltiSnips#Anon"](args.body)
      --end,
    },
    window = {
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
    },
    completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
    mapping = {
      ["<C-j>"] = cmp.mapping {
        c = function()
          if cmp.visible() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
          else
            vim.api.nvim_feedkeys(t "<Down>", "n", true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
          else
            fallback()
          end
        end,
      },
      ["<C-k>"] = cmp.mapping {
        c = function()
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
          else
            vim.api.nvim_feedkeys(t "<Up>", "n", true)
          end
        end,
        i = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
          else
            fallback()
          end
        end,
      },
      -- ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
      -- ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping {
        i = function(fallback)
          if cmp.visible() then
            if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
              return press "<C-R>=UltiSnips#ExpandSnippet()<CR>"
            end
            cmp.confirm { behavior = cmp.ConfirmBehavior.Replace }
          elseif has_any_words_before() then
            press "<Space>"
          else
            fallback()
          end
        end,
        c = function()
          if cmp.visible() then
            cmp.confirm { behavior = cmp.ConfirmBehavior.Replace }
          else
            vim.api.nvim_feedkeys(t "<Down>", "n", true)
          end
        end,
      },
      ["<C-e>"] = cmp.mapping.close(),
      ["<C-y>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<Tab>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() then
            print("HELLO")
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
          else
            fallback()
          end
        end,
        s = function(fallback)
          if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
          else
            fallback()
          end
        end
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
          press "<ESC>:call UltiSnips#JumpBackwards()<CR>"
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          press "<S-Tab>"
          fallback()
        end
      end, {
          "i",
          "s",
          "c",
        }),
    },
    sources = {
      { name = "nvim_lsp", max_item_count = 10 },
      { name = "nvim_lua", max_item_count = 5 },
      { name = "ultisnips", max_item_count = 5 },
      -- { name = "vsnip", max_item_count = 5 },
      { name = "buffer", keyword_length = 5, max_item_count = 5 },
      { name = "path" },
      { name = "treesitter", max_item_count = 10 },
      { name = "crates" },
      -- { name = "cmp_openai_codex" },
      -- { name = "emoji" },
      -- { name = "neorg" },
      -- { name = "look" },
      -- { name = "calc" },
      -- { name = "spell" },
      -- { name = "cmp_tabnine" },
    },
    experimental = { native_menu = false, ghost_text = false },
  }
end

return M
