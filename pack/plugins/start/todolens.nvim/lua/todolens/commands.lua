local M = {}
local highlight = require("todolens.highlight")

M.setup = function()
  -- Command to enable highlighting
  vim.api.nvim_create_user_command("TodoLensEnable", function()
    -- Safeguard to ensure the highlight function exists
    if highlight and highlight.highlight_buffer then
      highlight.highlight_buffer()
      vim.notify("TodoLens highlighting enabled.", vim.log.levels.INFO)
    else
      vim.notify("Failed to enable TodoLens highlighting: highlight function not found.", vim.log.levels.ERROR)
    end
  end, { desc = "Enable highlighting of TODOs and FIXMEs" })

  -- Command to disable highlighting
  vim.api.nvim_create_user_command("TodoLensDisable", function()
    -- Clear matches safely
    local cleared = vim.fn.clearmatches()
    vim.notify("TodoLens highlighting disabled. Cleared " .. cleared .. " matches.", vim.log.levels.INFO)
  end, { desc = "Disable highlighting of TODOs and FIXMEs" })
end

return M

