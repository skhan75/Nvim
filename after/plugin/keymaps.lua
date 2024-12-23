local M = {}

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.setup()
  -- Map Esc to jk in Insert Mode
  map('i', 'jk', '<Esc>')

  -- -- Set leader to Space
  map(
    "",
    "<Space>",
    "<Nop>",
    { noremap = true, silent = true }
  )

  -- Move text up and down
  map("n", "J", ":m .+1<CR>==")
  map("n", "K", ":m .-2<CR>==")
  map("v", "K", ":m '<-2<CR>gv=gv")
  map("v", "J", ":m '>+1<CR>gv=gv")

  -- Move Buffers/Tabs
  map("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
  map("n", "<A-.>", "<Cmd>BufferNext<CR>")
 

  -- Resize with arrows
  map("n", "<C-Up>", ":resize -2<CR>")
  map("n", "<C-Down>", ":resize +2<CR>")
  map("n", "<C-Left>", ":vertical resize -2<CR>")
  map("n", "<C-Right>", ":vertical resize +2<CR>")

  -- Telescope find files
  map("n", "<leader>t", "<Cmd>Telescope<Cr>")
  map("n", "<leader>ff", "<Cmd>Telescope find_files<Cr>")
  map("n", "<leader>fp", "<Cmd>Telescope find_project_files<Cr>")
  map("n", "<leader>fg", "<Cmd>Telescope live_grep<Cr>")
  map("n", "<leader>fs", "<Cmd>Telescope grep_string<Cr>")
  map("n", "<leader>fb", "<Cmd>Telescope buffers<Cr>")
  map("n", "<leader>gf", "<Cmd>Telescope git_files<Cr>")
  map("n", "<leader>fm", "<Cmd>Telescope marks<Cr>")

  -- Save and Quit
  map("n", "<leader>w", "<cmd>w!<CR>")
  map("n", "<leader>q", "<cmd>q!<CR>")

  -- NvimTree Toggle
  map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

  -- Tagbar (ctags)
  map("n", "<leader>cc", "<Cmd>TagbarToggle<Cr>")

  -- Lspsaga
  map("n", "gh", "<Cmd>Lspsaga lsp_finder<Cr>")
  map("n", "gr", "<Cmd>Lspsaga rename<Cr>")
  map("n", "gd", "<Cmd>Lspsaga peek_definition<Cr>")
  map("n", "<leader>ca", "<Cmd>Lspsaga code_action<Cr>")
  map("n", "<leader>cd", "<Cmd>Lspsaga show_line_diagnostics<Cr>")
  map("n", "[e", "<Cmd>Lspsaga diagnostic_jump_prev<Cr>")
  map("n", "]e", "<Cmd>Lspsaga diagnostic_jump_next<Cr>")
  --map("n", "<A-d>", "<Cmd>Lspsaga open_floaterm<Cr>")
  --map("n", "<A-dd>", "<Cmd>Lspsaga close_floaterm<Cr>")

  -- TODO: Do it sometime soon
  -- Create mapping for search and replace all occurences of the word under the cursor
  -- Create mapping for delete word on Ctrl+Backspace
end

M.setup()
