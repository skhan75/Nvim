-- formatter.lua

-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations by filetype

    -- JavaScript and TypeScript
    javascript = {
      -- prettierd
      function()
        return {
          exe = "prettierd",
          args = { util.escape_path(util.get_current_buffer_file_path()) },
          stdin = true,
        }
      end,
    },

    typescript = {
      -- prettierd
      function()
        return {
          exe = "prettierd",
          args = { util.escape_path(util.get_current_buffer_file_path()) },
          stdin = true,
        }
      end,
    },

    -- Python
    python = {
      -- black
      function()
        return {
          exe = "black",
          args = { "-" },
          stdin = true,
        }
      end,
    },

    -- Lua
    lua = {
      -- stylua
      function()
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "-",
          },
          stdin = true,
        }
      end,
    },

    -- Add other formatters as needed
  },
})

