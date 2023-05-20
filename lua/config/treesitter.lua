local M = {}

function M.setup()
  local status_ok, tsconfigs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  tsconfigs.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
      "c", "lua", "rust", "java", "python", "javascript", "typescript", "html",
      "markdown", "go", "json", "php", "yaml", "vim"
    },
    -- Install parsers synchronously
    sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    highlight = {
      enable = true,
      --  to disable slow treesitter highlight for large files
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = { enable = true },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
    },
    rainbow = {
      enable = true,
      extended_mode = true
    },
    autopairs = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = { ["<Leader>rx"] = "@parameter.inner" },
        swap_previous = { ["<Leader>rX"] = "@parameter.inner" },
      },
      lsp_interop = {
        enable = true,
        border = "none",
        peek_definition_code = {
          ["df"] = "@function.outer",
          ["dF"] = "@class.outer",
        },
      },
    },
    context_commentstring = { enable = true, enable_autocmd = false },
    -- textsubjects = {
    --     enable = true,
    --     keymaps = {
    --         ["."] = "textsubjects-smart",
    --         [";"] = "textsubjects-container-outer",
    --     },
    -- },
    matchup = { enable = true },
  }
end

return M
