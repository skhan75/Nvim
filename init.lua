-- Plugin setup
require("plugins").setup()
require('telescope').load_extension('aerial')

-- Configure and enable Nightfox with transparency
local nightfox = require("nightfox")
nightfox.setup({
  options = {
    --transparent = true, -- Note: Only used if you actually do :colorscheme nightfox
    dim_inactive = false,
    styles = {
      comments = "italic",
      functions = "bold",
      keywords = "italic,bold",
    },
  },
})

require("tokyonight").setup({
  style = "night",
  transparent = true,
  dim_inactive = false,
})

-- Enable true colors for Neovim
vim.cmd [[
  if has("termguicolors")
    set termguicolors
  endif
  syntax enable
]]

vim.g.adwaita_transparent = true
vim.g.adwaita_darker = true
-- vim.g.adwaita_disable_cursorline = true
vim.cmd("colorscheme adwaita")

-- Additional transparency for specific UI elements
--vim.cmd [[
--  hi Normal guibg=NONE ctermbg=NONE   " Main editor background
--  hi NormalNC guibg=NONE ctermbg=NONE " Inactive windows
--  hi SignColumn guibg=NONE ctermbg=NONE  " Sign column (e.g., for LSP diagnostics)
--  hi Pmenu guibg=NONE ctermbg=NONE      " Popup menu
--  hi PmenuSel guibg=NONE ctermbg=NONE   " Selected popup menu item
--  hi VertSplit guibg=NONE ctermbg=NONE  " Vertical split line
--  hi StatusLineNC guibg=NONE ctermbg=NONE " Inactive status line
--]]
-- hi LineNr guibg=NONE ctermbg=NONE     " Line numbers
-- hi EndOfBuffer guibg=NONE ctermbg=NONE " Tilde (~) lines at the end of the buffer
