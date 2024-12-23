local M = {}

M.defaults = {
  keywords = { "TODO", "FIXME", "NOTE" },
  highlight = { -- Default colors
    TODO = "Yellow",
    FIXME = "Red",
    NOTE = "Blue",
  },
  languages = {
    lua = "--",
    python = "#",
    javascript = "//",
    java = "//",
  },
}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

function M.get_comment_symbol()
  local commentstring = vim.bo.commentstring or ""
  local config = M.options
  local user_languages = config.languages or {}
  local all_languages = vim.tbl_deep_extend("force", M.defaults.languages, user_languages)
  -- If commentstring is valid, extract comment symbol
  local auto_detected = commentstring:match("^(.*)%%s")
  if auto_detected then
    auto_detected = vim.trim(auto_detected)
  end
  -- Fall back to language-specific comment symbol
  return auto_detected or all_languages[vim.bo.filetype]
end

return M

