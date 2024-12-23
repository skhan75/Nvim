local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local config = require("todolens.config").options

local M = {}

-- Function to find using ripgrep
local find_todos = function()
  local results = {}
  local comment_symbol = config.languages[vim.bo.filetype]

  if not comment_symbol then
    return results
  end

  for _, keyword in ipairs(config.keywords) do
    -- Convert Lua pattern to regex format
    local pattern = string.format("%s.*%s", comment_symbol:gsub("%%", "\\"), keyword)
    local output = vim.fn.systemlist(string.format("rg --no-heading -H -n -e '%s'", pattern))

    -- Check for any errors in the output
    if vim.v.shell_error ~= 0 then
      print("Ripgrep error:", vim.inspect(output)) -- Debug if `rg` fails
    else
      print("Ripgrep output:", vim.inspect(output)) -- Debug successful `rg` output
    end

    vim.list_extend(results, output)
  end
  return results
end


-- The Telescope picker
M.todolens = function(opts)
  opts = opts or {}
  local todos = find_todos()

  pickers.new(opts, {
    prompt_title = "TODOLENS",
    finder = finders.new_table({
      results = todos,
      entry_maker = function(line)
        -- Extract filename, line number, and content
        local filename, lnum, content = line:match("([^:]+):(%d+):(.*)")
        if not filename or not lnum or not content then
          return nil
        end
        -- Format the display with the full filename
        local display = string.format("%s:%s %s", filename, lnum, content)
        return {
          value = line,
          display = display,
          ordinal = filename .. content,
          filename = filename,
          lnum = tonumber(lnum),
          content = content,
        }
      end,
    }),
    sorter = sorters.get_generic_fuzzy_sorter(),
    previewer = previewers.vim_buffer_cat.new(opts),
  }):find()
end

-- Telescope setup function
return telescope.register_extension({
  setup = function(ext_config, config)
    -- Optional: Use ext_config to set up any extension-specific configurations
    -- ext_config contains configuration passed during `telescope.load_extension()`
    -- config contains Telescope's main configuration
  end,
  exports = {
    todolens = M.todolens,
  },
})

