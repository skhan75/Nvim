local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Basic File and Text Searching
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")       -- Find files
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")        -- Grep in files
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")          -- List open buffers
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")        -- Help tags

-- Custom mapping to delete enclosing brackets
map("n", "<leader>db", "vi{:normal! f{di{f}di}<CR>", { noremap = true, silent = true })

-- Telescope Extensions Mappings
map("n", "<leader>fm", "<cmd>Telescope media_files<cr>")      -- Media Files Preview
map("n", "<leader>fbr", "<cmd>Telescope file_browser<cr>")    -- File Browser
map("n", "<leader>fp", "<cmd>Telescope project<cr>")          -- Project Management

-- Advanced Searching
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")         -- Recently opened files
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")          -- Show key mappings
map("n", "<leader>mm", "<cmd>Telescope marks<cr>")            -- List marks
map("n", "<leader>fq", "<cmd>Telescope quickfix<cr>")         -- Show quickfix list
map("n", "<leader>fl", "<cmd>Telescope loclist<cr>")          -- Show location list

-- Git Integration
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>")       -- Git status
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")     -- Git branches
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")      -- Git commits
map("n", "<leader>gf", "<cmd>Telescope git_files<cr>")        -- Git tracked files

-- Session Management
map("n", "<leader>sl", "<cmd>Telescope session-lens search_session<cr>")  -- Search sessions

-- Search within Configuration Files
map("n", "<leader>fc", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>")  -- Search within your Neovim config

-- Diagnostics and LSP-related Searches
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")       -- Show diagnostics
map("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>")    -- Show LSP references
map("n", "<leader>ld", "<cmd>Telescope lsp_document_symbols<cr>") -- Show document symbols

-- Searching through Command History
map("n", "<leader>fhc", "<cmd>Telescope command_history<cr>") -- Show command history
map("n", "<leader>fhb", "<cmd>Telescope buffer_history<cr>")  -- Show buffer history

-- Searching through Registers
map("n", "<leader>frg", "<cmd>Telescope registers<cr>")       -- Show registers

-- Search through your Neovim Configuration (Useful for quickly accessing config files)
map("n", "<leader>fvc", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>")  -- Search in config files

-- Barbar.nvim Buffer Management
map("n", "<C-h>", ":BufferPrevious<CR>")
map("n", "<C-l>", ":BufferNext<CR>")

-- Go to a specific buffer by number
map("n", "<leader>1", ":BufferGoto 1<CR>")
map("n", "<leader>2", ":BufferGoto 2<CR>")
map("n", "<leader>3", ":BufferGoto 3<CR>")
map("n", "<leader>4", ":BufferGoto 4<CR>")
map("n", "<leader>5", ":BufferGoto 5<CR>")
map("n", "<leader>6", ":BufferGoto 6<CR>")
map("n", "<leader>7", ":BufferGoto 7<CR>")
map("n", "<leader>8", ":BufferGoto 8<CR>")
map("n", "<leader>9", ":BufferGoto 9<CR>")

-- Close the current buffer
map("n", "<leader>bc", ":BufferClose<CR>")

-- Pick a buffer to go to
map("n", "<leader>bp", ":BufferPick<CR>")

-- Re-order buffers
map("n", "<leader>bm", ":BufferMoveNext<CR>")  -- Move buffer to the right
map("n", "<leader>bm", ":BufferMovePrevious<CR>")  -- Move buffer to the left

-- Aerial Toggle (Code Outline)
map("n", "<leader>a", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true })

-- Leap.nvim Mappings
map("n", "s", "<Plug>(leap-forward-to)", {})
map("n", "S", "<Plug>(leap-backward-to)", {})
--map("x", "s", "<Plug>(leap-forward-to)", {})
--map("x", "S", "<Plug>(leap-backward-to)", {})
--map("o", "z", "<Plug>(leap-forward-to)", {})
--map("o", "Z", "<Plug>(leap-backward-to)", {})
--
---- Additional mappings to work correctly in visual mode
--map("v", "s", "<Plug>(leap-forward-to)", {})
--map("v", "S", "<Plug>(leap-backward-to)", {})

-- Formatter Keybindings
map("n", "<leader>F", "<cmd>Format<CR>")       -- Format the current buffer
map("n", "<leader>FW", "<cmd>FormatWrite<CR>") -- Format and save the current buffer

-- Yank entire file
map("n", "<leader>ya", "ggVGy")  -- Yank the entire file content

-- Delete entire file contents
map("n", "<leader>da", "ggdG")  -- Delete the entire file content

-- Option+Backspace for deleting a whole word in insert mode
map("i", "<M-BS>", "<C-w>", { noremap = true, silent = true })

-- Key mapping to close all notifications
map("n", "<leader>x", '<cmd>lua require("notify").dismiss()<CR>', { noremap = true, silent = true })

-- Harpoon Mappings
map("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>")
map("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
map("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>")
map("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>")
map("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>")
map("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>")

-- Map <leader>as to open Telescope Aerial
map("n", "<leader>as", "<cmd>Telescope aerial<CR>")
