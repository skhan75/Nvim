local M = {}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}


local mappings = {
  -- b = {
  --     "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
  --     "Buffers",
  -- },
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  w = { "<cmd>w!<CR>", "Save" },
  q = { "<cmd>q!<CR>", "Quit" },

  -- System
  z = {
    name = "System",
    b = {
      "<Cmd>hi Normal ctermbg=none guibg=none<CR>",
      "Transparent background",
    },
    s = { ":<C-u>SaveSession<Cr>", "Save session" },
    l = { ":<C-u>SearchSession<Cr>", "Load session" },
    c = { "<Cmd>Telescope colorscheme<Cr>", "Color scheme" },
    h = { "<Cmd>ToggleTerm<CR>", "New horizontal terminal" },
    t = { "<Cmd>terminal<CR>", "New terminal" },
    e = { "!!$SHELL<CR>", "Execute line" },
    z = {
      "<Cmd>lua require('config.telescope').search_dotfiles()<CR>",
      "Configuration",
    },
    r = { "<Cmd>luafile %<Cr>", "Reload lua file" },
    m = { "<Cmd>messages<Cr>", "Messages" },
    p = { "<Cmd>messages clear<Cr>", "Clear messages" },
    f = { "<Cmd>FloatermNew<Cr>", "Floating terminal" },
    i = { "<Cmd>PackerUpdate<Cr>", "Packer update" },
    y = { "<Cmd>Telescope neoclip<Cr>", "Clipboard manager" },
    x = { "<Cmd>Telescope bookmarks<Cr>", "Browser bookmarks" },
  },

  -- Everything Files
  f = {
    name = "Files",
    f = { "<Cmd>Telescope find_files<Cr>","Find files" },
    b = { "<Cmd>Telescope buffers<Cr>", "Search buffers" },
    g = { "<Cmd>Telescope live_grep<Cr>", "Live grep" },
    c = { "<Cmd>Telescope current_buffer_fuzzy_find<Cr>", "Search current buffer" },
    gf = { "<Cmd>Telescope git_files<Cr>", "Git files" },
    h = { "<Cmd>Telescope help_tags<Cr>", "Help" },
    p = { "<Cmd>Telescope file_browser<Cr>", "Pop-up file browser" },
    m = { "<Cmd>Telescope marks<Cr>", "Mark" },
    r = { "<Cmd>Telescope frecency<Cr>", "Recent file" },
    s = { "<Cmd>Telescope symbols<Cr>", "Symbols" },
    t = { "<Cmd>Telescope<CR>", "Telescope" },
    l = { "<Cmd>e!<CR>", "Reload file" },
    j = { "<Cmd>Telescope zoxide list<CR>", "Jump to folder" },
  },

  -- Buffer
  b = {
    name = "Buffer",
    a = { "<Cmd>BWipeout other<Cr>", "Delete all buffers" },
    c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    d = { "<Cmd>bd<Cr>", "Delete current buffer" },
    f = { "<Cmd>bd!<Cr>", "Force delete current buffer" },
    l = { "<Cmd>ls<Cr>", "List buffers" },
    n = { "<Cmd>bn<Cr>", "Next buffer" },
    p = { "<Cmd>bp<Cr>", "Previous buffer" },
  },

  -- Packer
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  -- Search
  s = {
    name = "Search",
    w = {
      "<Cmd>lua require('telescope').extensions.arecibo.websearch()<CR>",
      "Web search",
    },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    f = { "<Cmd>Telescope find_files<Cr>", "Find files" },
  },

  -- Text 
  t = {
    name = "Text",
    w = { "vaw", "Select Word under Cursor" },
    yw = { "yaw", "Yank Word under Cursor" },
  }
}

local lsp_mappings = {

  l = {
    name = "LSP",
    r = { "<Cmd>Lspsaga rename<CR>", "Rename" },
    u = { "<Cmd>Telescope lsp_references<CR>", "References" },
    o = { "<Cmd>Telescope lsp_document_symbols<CR>", "Document symbols" },
    d = { "<Cmd>Telescope lsp_definitions<CR>", "Definition" },
    a = { "<Cmd>Telescope lsp_code_actions<CR>", "Code actions" },
    e = { "<Cmd>lua vim.diagnostic.enable()<CR>", "Enable diagnostics" },
    x = { "<Cmd>lua vim.diagnostic.disable()<CR>", "Disable diagnostics" },
    n = { "<Cmd>update<CR>:Neoformat<CR>", "Neoformat" },
    t = { "<Cmd>TroubleToggle<CR>", "Trouble" },
  },

  -- WIP - refactoring
  -- nnoremap <silent><leader>chd :Lspsaga hover_doc<CR>
  -- nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
  -- nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
  -- nnoremap <silent><leader>cpd:Lspsaga preview_definition<CR>
  -- nnoremap <silent> <leader>cld :Lspsaga show_line_diagnostics<CR>
  -- {'n', '<leader>lds', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>' },
  -- {'n', '<leader>lde', '<cmd>lua vim.diagnostic.enable()<CR>'},
  -- {'n', '<leader>ldd', '<cmd>lua vim.diagnostic.disable()<CR>'},
  -- {'n', '<leader>ll', '<cmd>lua vim.diagnostic.set_loclist()<CR>'},
  -- {'n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>'},
  -- {'v', '<leader>lcr', '<cmd>lua vim.lsp.buf.range_code_action()<CR>'},
}

local lsp_mappings_opts = {
  {
    "document_formatting",
    { ["lf"] = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format" } },
  },
  {
    "code_lens",
    {
      ["ll"] = {
        "<Cmd>lua vim.lsp.codelens.refresh()<CR>",
        "Codelens refresh",
      },
    },
  },
  {
    "code_lens",
    { ["ls"] = { "<Cmd>lua vim.lsp.codelens.run()<CR>", "Codelens run" } },
  },
}

function M.register_lsp(client)
  local wk = require "which-key"
  wk.register(lsp_mappings, opts)

  for _, m in pairs(lsp_mappings_opts) do
    local capability, key = unpack(m)
    if client.server_capabilities[capability] then
      wk.register(key, opts)
    end
  end
end

function M.setup()
  local whichkey = require "which-key"
  whichkey.setup {}
  whichkey.register(mappings, opts)
end

return M
