local wk = require("which-key")

--local function map_with_which_key(mode, lhs, rhs, opts)
--  local options = { noremap = true, silent = true }
--  if opts then
--    options = vim.tbl_extend("force", options, opts)
--  end
--  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
--
--  -- Register with which-key
--  if opts and opts.desc then
--    wk.register({
--      [lhs] = { rhs, opts.desc },
--    }, { mode = mode })
--  end
--end

local function map_with_which_key(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  -- Register directly with which-key
  wk.register({
    [lhs] = { rhs, opts.desc or "" },
  }, { mode = mode })
end

-- Basic File and Text Searching
map_with_which_key("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map_with_which_key("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Search text in files" })
map_with_which_key("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List open buffers" })
map_with_which_key("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Search help tags" })

-- [DEPRECATED][ISSUES] Custom map_with_which_keyping to delete enclosing brackets
-- map_with_which_key("n", "<leader>db", "vi{:normal! f{di{f}di}<CR>", { desc = "Delete enclosing brackets" })

-- Telescope Extensions map_with_which_keypings
map_with_which_key("n", "<leader>fm", "<cmd>Telescope media_files<cr>", { desc = "Search media files" })
map_with_which_key("n", "<leader>fbr", "<cmd>Telescope file_browser<cr>", { desc = "Open file browser" })
map_with_which_key("n", "<leader>fp", "<cmd>Telescope project<cr>", { desc = "Search projects" })

-- Advanced Searching
map_with_which_key("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Recently opened files" })
map_with_which_key("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Show key mappings" })
map_with_which_key("n", "<leader>mm", "<cmd>Telescope marks<cr>", { desc = "Show marks" })
map_with_which_key("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Show quickfix list" })
map_with_which_key("n", "<leader>fl", "<cmd>Telescope loclist<cr>", { desc = "Show location list" })

-- Git Integration
map_with_which_key("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
map_with_which_key("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
map_with_which_key("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map_with_which_key("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Git tracked files" })

-- Session Management
map_with_which_key("n", "<leader>sl", "<cmd>Telescope session-lens search_session<cr>", { desc = "Search sessions" })

-- Search within Configuration Files
map_with_which_key("n", "<leader>fc", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>",
  { desc = "Search in config files" })

-- Diagnostics and LSP-related Searches
map_with_which_key("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Show diagnostics" })
map_with_which_key("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "Show LSP references" })
map_with_which_key("n", "<leader>ld", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Show document symbols" })

-- Searching through Command History
map_with_which_key("n", "<leader>fhc", "<cmd>Telescope command_history<cr>", { desc = "Show command history" })
map_with_which_key("n", "<leader>fhb", "<cmd>Telescope buffer_history<cr>", { desc = "Show buffer history" })

-- Searching through Registers
map_with_which_key("n", "<leader>frg", "<cmd>Telescope registers<cr>", { desc = "Show registers" })

-- Search through your Neovim Configuration
map_with_which_key("n", "<leader>fvc", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>",
  { desc = "Search in Neovim config" })

-- Barbar.nvim Buffer Management
map_with_which_key("n", "<C-h>", ":BufferPrevious<CR>", { desc = "Go to previous buffer" })
map_with_which_key("n", "<C-l>", ":BufferNext<CR>", { desc = "Go to next buffer" })

-- Go to a specific buffer by number
map_with_which_key("n", "<leader>1", ":BufferGoto 1<CR>", { desc = "Go to buffer 1" })
map_with_which_key("n", "<leader>2", ":BufferGoto 2<CR>", { desc = "Go to buffer 2" })
map_with_which_key("n", "<leader>3", ":BufferGoto 3<CR>", { desc = "Go to buffer 3" })
map_with_which_key("n", "<leader>4", ":BufferGoto 4<CR>", { desc = "Go to buffer 4" })
map_with_which_key("n", "<leader>5", ":BufferGoto 5<CR>", { desc = "Go to buffer 5" })
map_with_which_key("n", "<leader>6", ":BufferGoto 6<CR>", { desc = "Go to buffer 6" })
map_with_which_key("n", "<leader>7", ":BufferGoto 7<CR>", { desc = "Go to buffer 7" })
map_with_which_key("n", "<leader>8", ":BufferGoto 8<CR>", { desc = "Go to buffer 8" })
map_with_which_key("n", "<leader>9", ":BufferGoto 9<CR>", { desc = "Go to buffer 9" })

-- Close the current buffer
map_with_which_key("n", "<leader>bc", ":BufferClose<CR>", { desc = "Close current buffer" })

-- Pick a buffer to go to
map_with_which_key("n", "<leader>bp", ":BufferPick<CR>", { desc = "Pick a buffer" })

-- Re-order buffers
map_with_which_key("n", "<leader>br", ":BufferMoveNext<CR>", { desc = "Move buffer to the right" })
map_with_which_key("n", "<leader>bl", ":BufferMovePrevious<CR>", { desc = "Move buffer to the left" })

-- Aerial Toggle (Code Outline)
map_with_which_key("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle code outline" })

-- Leap.nvim map_with_which_keypings
map_with_which_key("n", "s", "<Plug>(leap-forward-to)", { desc = "Leap forward" })
map_with_which_key("n", "S", "<Plug>(leap-backward-to)", { desc = "Leap backward" })

-- Formatter Keybindings
map_with_which_key("n", "<leader>F", "<cmd>Format<CR>", { desc = "Format current buffer" })
map_with_which_key("n", "<leader>FW", "<cmd>FormatWrite<CR>", { desc = "Format and save buffer" })

-- Yank entire file
map_with_which_key("n", "<leader>ya", "ggVGy", { desc = "Yank entire file" })

-- Delete entire file contents
map_with_which_key("n", "<leader>da", "ggdG", { desc = "Delete entire file contents" })

-- Option+Backspace for deleting a whole word in insert mode
map_with_which_key("i", "<M-BS>", "<C-w>", { desc = "Delete word in insert mode" })

-- Key map_with_which_keyping to close all notifications
map_with_which_key("n", "<leader>x", '<cmd>lua require("notify").dismiss()<CR>', { desc = "Close all notifications" })

-- Harpoon map_with_which_keypings
map_with_which_key("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", { desc = "Add file to Harpoon" })
map_with_which_key("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
  { desc = "Toggle Harpoon menu" })
map_with_which_key("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Go to Harpoon file 1" })
map_with_which_key("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Go to Harpoon file 2" })
map_with_which_key("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Go to Harpoon file 3" })
map_with_which_key("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Go to Harpoon file 4" })

-- GitSigns Key map_with_which_keypings
map_with_which_key("n", "<leader>gl", ":lua require('gitsigns').toggle_linehl()<CR>",
  { desc = "Toggle Git line highlights" })
map_with_which_key("n", "<leader>gs", ":lua require('gitsigns').stage_hunk()<CR>", { desc = "Stage hunk" })
map_with_which_key("n", "<leader>gu", ":lua require('gitsigns').reset_hunk()<CR>", { desc = "Undo hunk" })
map_with_which_key("n", "<leader>gp", ":lua require('gitsigns').preview_hunk()<CR>", { desc = "Preview hunk" })
map_with_which_key("n", "<leader>gb", ":lua require('gitsigns').blame_line()<CR>", { desc = "Blame line" })
map_with_which_key("n", "<leader>gn", ":lua require('gitsigns').next_hunk()<CR>", { desc = "Go to next hunk" })
map_with_which_key("n", "<leader>gN", ":lua require('gitsigns').prev_hunk()<CR>", { desc = "Go to previous hunk" })
map_with_which_key("n", "<leader>gr", ":lua require('gitsigns').reset_buffer()<CR>", { desc = "Reset buffer" })
map_with_which_key("n", "<leader>gS", ":lua require('gitsigns').stage_buffer()<CR>", { desc = "Stage buffer" })
map_with_which_key("n", "<leader>gd", ":lua require('gitsigns').toggle_deleted()<CR>", { desc = "Toggle deleted lines" })
map_with_which_key("n", "<leader>gw", ":lua require('gitsigns').toggle_word_diff()<CR>", { desc = "Toggle word diff" })
map_with_which_key("n", "<leader>gB", ":lua require('gitsigns').toggle_current_line_blame()<CR>",
  { desc = "Toggle line blame" })
