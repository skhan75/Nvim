-- Plugin setup
require("plugins").setup()
require('telescope').load_extension('aerial')

-- Configure and enable Nightfox with transparency
local nightfox = require("nightfox")
nightfox.setup({
  options = {
    transparent = false, -- Enable transparency for Nightfox
    dim_inactive = false, -- Keep inactive windows opaque
    styles = {
      comments = "italic", -- Example: Style for comments
      functions = "bold", -- Example: Style for functions
      keywords = "italic,bold", -- Example: Style for keywords
    },
  },
})

-- Enable true colors for Neovim
vim.cmd [[
  if has("termguicolors")
    set termguicolors
  endif
  syntax enable
]]

-- Set and load Nightfox colorscheme
vim.cmd [[colorscheme nightfox]]

-- Load and setup the todolens plugin
--require("todolens").setup({
--    keywords = { "TODO", "FIXME", "NOTE" }, -- Define which keywords to track
--    highlight = {
--        TODO = "Yellow",
--        FIXME = "Red",
--        NOTE = "Blue",
--    },
--    languages = {
--        lua = "--",        -- Comment symbol for Lua
--        python = "#",      -- Comment symbol for Python
--        javascript = "//", -- Comment symbol for JavaScript
--    },
--})
--require("telescope").load_extension("todolens")


-- Additional transparency for specific UI elements
--vim.cmd [[
--  hi Normal guibg=NONE ctermbg=NONE   " Main editor background
--  hi NormalNC guibg=NONE ctermbg=NONE " Inactive windows
--  hi EndOfBuffer guibg=NONE ctermbg=NONE " Tilde (~) lines at the end of the buffer
--  hi SignColumn guibg=NONE ctermbg=NONE  " Sign column (e.g., for LSP diagnostics)
--  hi LineNr guibg=NONE ctermbg=NONE     " Line numbers
--  hi Pmenu guibg=NONE ctermbg=NONE      " Popup menu
--  hi PmenuSel guibg=NONE ctermbg=NONE   " Selected popup menu item
--  hi VertSplit guibg=NONE ctermbg=NONE  " Vertical split line
--  hi StatusLineNC guibg=NONE ctermbg=NONE " Inactive status line
--]]

