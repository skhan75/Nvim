local M = {}

function M.setup()
  local nvim_tree = require "nvim-tree"
  nvim_tree.setup({
    sort_by = "case_sensitive",
    -- create_in_closed_folder = true, -- Creates file inside the current selected closed folder instead of parent
    hijack_cursor = true,
    select_prompts = true,
    view = {
      adaptive_size = true,
      width = 35,
      side = "left", -- default "left"
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
        },
      },
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
    },
    filters = {
      dotfiles = false,
    },
  })
end

return M
