local M = {}

-- Function to define highlight groups with defaults
local function define_highlight_group(group_name, color)
  vim.cmd(string.format(
    "highlight %s guifg=%s guibg=NONE gui=bold ctermfg=%s ctermbg=NONE cterm=bold",
    group_name,
    color,
    color
  ))
end

function M.setup()
  local config = require("todolens.config").options

  -- Default highlight colors
  local default_highlights = {
    TODO = "Yellow",
    FIXME = "Red",
    NOTE = "Blue",
  }

  -- Merge user-defined highlight colors
  local user_highlights = config.highlight or {}
  local highlights = vim.tbl_deep_extend("force", default_highlights, user_highlights)

  -- Define highlight groups
  for keyword, color in pairs(highlights) do
    local group_name = "Todolens" .. keyword
    define_highlight_group(group_name, color)
  end

  -- Automatically highlight  keywords in relevant filetypes
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    callback = function()
      local comment_symbol = vim.trim(require("todolens.config").get_comment_symbol())

      if comment_symbol then
        for _, keyword in ipairs(config.keywords) do
          keyword = vim.trim(keyword)
          -- Corrected pattern construction
          local pattern = string.format("\\%s\\s*\\zs\\<%s\\>", comment_symbol, keyword)
          local group_name = "Todolens" .. keyword
          vim.fn.matchadd(group_name, pattern)
        end
      else
      end
    end,
  })
end

return M
