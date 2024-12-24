-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/samiahmadkhan/.cache/nvim/packer_hererocks/2.1.1716656478/share/lua/5.1/?.lua;/Users/samiahmadkhan/.cache/nvim/packer_hererocks/2.1.1716656478/share/lua/5.1/?/init.lua;/Users/samiahmadkhan/.cache/nvim/packer_hererocks/2.1.1716656478/lib/luarocks/rocks-5.1/?.lua;/Users/samiahmadkhan/.cache/nvim/packer_hererocks/2.1.1716656478/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/samiahmadkhan/.cache/nvim/packer_hererocks/2.1.1716656478/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\nπ\4\0\0\6\0\17\0\0256\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\nÄ9\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\4B\2\2\1X\2\bÄ6\2\v\0009\2\f\2'\4\r\0006\5\v\0009\5\14\0059\5\15\0059\5\16\5B\2\3\1K\0\1\0\nERROR\vlevels\blog\25Error loading Aerial\vnotify\bvim\fkeymaps\1\0\t\14<leader>a\vtoggle\18<2-LeftMouse>\17actions.jump\t<CR>\17actions.jump\6{\17actions.prev\6}\17actions.next\n<C-k>\26actions.up_and_scroll\n<C-j>\28actions.down_and_scroll\a]]\20actions.next_up\a[[\20actions.prev_up\vlayout\1\0\2\22default_direction\17prefer_right\14min_width\3\30\rbackends\1\0\a\16attach_mode\vglobal\fkeymaps\0\vlayout\0\rbackends\0\14nerd_font\tauto\22highlight_closest\2\17manage_folds\2\1\4\0\0\blsp\15treesitter\rmarkdown\nsetup\vaerial\frequire\npcall\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nû\b\0\0\5\0 \0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\17\0025\3\19\0005\4\18\0=\4\5\0035\4\20\0=\4\a\0035\4\21\0=\4\t\0035\4\22\0=\4\v\0035\4\23\0=\4\r\0035\4\24\0=\4\15\3=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\19preview_config\1\0\5\brow\3\0\bcol\3\1\rrelative\vcursor\vborder\vsingle\nstyle\fminimal\28current_line_blame_opts\1\0\6\23virt_text_priority\3d\22ignore_whitespace\1\ndelay\3Ë\a\18virt_text_pos\beol\14virt_text\2\14use_focus\2\17watch_gitdir\1\0\1\17follow_files\2\17signs_staged\1\0\1\ttext\b‚îÜ\1\0\1\ttext\6~\1\0\1\ttext\b‚Äæ\1\0\1\ttext\6_\1\0\1\ttext\b‚îÉ\1\0\6\vdelete\0\vchange\0\14untracked\0\badd\0\17changedelete\0\14topdelete\0\1\0\1\ttext\b‚îÉ\nsigns\1\0\17\24signs_staged_enable\2\17signs_staged\0\18sign_priority\3\6\19preview_config\0\20max_file_length\3¿∏\2\20update_debounce\3d\nsigns\0!current_line_blame_formatter+<author>, <author_time:%R> - <summary>\28current_line_blame_opts\0\23current_line_blame\1\24attach_to_untracked\1\16auto_attach\2\17watch_gitdir\0\14word_diff\1\vlinehl\1\nnumhl\1\15signcolumn\2\14untracked\1\0\1\ttext\b‚îÜ\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\b‚Äæ\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\b‚îÉ\badd\1\0\6\vdelete\0\vchange\0\14untracked\0\badd\0\17changedelete\0\14topdelete\0\1\0\1\ttext\b‚îÉ\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\5\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\3Ä9\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\tleap\frequire\npcall\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-status.nvim"] = {
    config = { "\27LJ\2\nú\2\0\0\6\0\a\0\f6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\5Ä9\2\3\0015\4\4\0005\5\5\0=\5\6\4B\2\2\1K\0\1\0\19spinner_frames\1\v\0\0\b‚†ã\b‚†ô\b‚†π\b‚†∏\b‚†º\b‚†¥\b‚†¶\b‚†ß\b‚†á\b‚†è\1\0\a\19indicator_hint\tÔÅô \17indicator_ok\tÔÅò \19indicator_info\tÔÅö \19spinner_frames\0\23indicator_warnings\tÔÅ± \21indicator_errors\tÔÅó \18status_symbol\5\vconfig\15lsp-status\frequire\npcall\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n›\b\0\0\t\0%\0:6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\0023Ä9\2\3\0015\4\n\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\0054\6\0\0=\6\t\5=\5\v\0045\5\r\0005\6\f\0=\6\14\0055\6\15\0=\6\16\0054\6\3\0005\a\17\0>\a\1\0065\a\18\0005\b\19\0=\b\20\a5\b\21\0=\b\22\a>\a\2\6=\6\23\0054\6\3\0005\a\24\0>\a\1\6=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\5=\5\30\0045\5\31\0004\6\0\0=\6\14\0054\6\0\0=\6\16\0055\6 \0=\6\23\0055\6!\0=\6\25\0054\6\0\0=\6\27\0054\6\0\0=\6\29\5=\5\"\0045\5#\0=\5$\4B\2\2\1K\0\1\0\15extensions\1\4\0\0\rfugitive\14nvim-tree\rquickfix\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\6\14lualine_b\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_c\0\14lualine_y\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\vcolors\1\0\6\20lsp_client_name\f#ffffff\buse\2\fmessage\f#ffffff\ntitle\f#ffffff\15percentage\f#ffffff\fspinner\f#ffffff\23display_components\1\4\0\0\20lsp_client_name\fspinner\15percentage\1\2\2\0\17lsp_progress\vcolors\0\23display_components\0\1\2\2\0\rfilename\tpath\3\1\16file_status\2\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\6\14lualine_b\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_c\0\14lualine_y\0\1\2\0\0\tmode\foptions\1\0\4\22inactive_sections\0\15extensions\0\rsections\0\foptions\0\23disabled_filetypes\25component_separators\1\3\0\0\bÓÇ±\bÓÇ≥\23section_separators\1\3\0\0\bÓÇ∞\bÓÇ≤\1\0\4\ntheme\tauto\23section_separators\0\25component_separators\0\23disabled_filetypes\0\nsetup\flualine\frequire\npcall\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\n∑\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\21ensure_installed\0\1\v\0\0\rtsserver\veslint\vjsonls\thtml\ncssls\fpyright\ngopls\njdtls\vlua_ls\vclangd\nsetup\20mason-lspconfig\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    after = { "mason-lspconfig.nvim" },
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.icons"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/mini.icons",
    url = "https://github.com/echasnovski/mini.icons"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\nç\2\0\0\6\0\a\0\f6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\5Ä9\2\3\0015\4\5\0005\5\4\0=\5\6\4B\2\2\1K\0\1\0\rmappings\1\0\b\24attach_to_untracked\0\rrelative\0\25cursor_scrolls_alone\2\22respect_scrolloff\1\rstop_eof\2\16hide_cursor\2\21performance_mode\1\rmappings\0\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\npcall\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["neovim-ayu"] = {
    config = { "\27LJ\2\n]\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\14overrides\1\0\2\14overrides\0\vmirage\2\nsetup\bayu\frequire\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["night-owl.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/night-owl.nvim",
    url = "https://github.com/Julpikar/night-owl.nvim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  nvim = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nê\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\3\0\0\20TelescopePrompt\bvim\1\0\2\21disable_filetype\0\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nG\0\0\4\0\4\0\t6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\2Ä9\2\3\1B\2\1\1K\0\1\0\nsetup\fcmp_lsp\frequire\npcall\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15lsp_config\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nD\0\0\4\0\4\0\t6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\2Ä6\2\3\0=\1\2\2K\0\1\0\bvim\vnotify\frequire\npcall\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nM\0\0\5\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\3Ä9\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\14nvim-tree\frequire\npcall\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n‹\4\0\0\a\0\18\0\0246\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\17Ä9\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0005\6\f\0=\6\r\5=\5\14\0045\5\15\0=\5\16\0044\5\0\0=\5\17\4B\2\2\1K\0\1\0\fmodules\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\2\venable\2\fkeymaps\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\1\2\0\0\5\21ensure_installed\1\0\b\19ignore_install\0\17sync_install\1\fmodules\0\14highlight\0\26incremental_selection\0\21ensure_installed\0\vindent\0\17auto_install\2\1\15\0\0\6c\blua\tjava\vpython\15javascript\ago\rmarkdown\tjson\tyaml\bvim\15typescript\velixir\theex\beex\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\nÔ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14skip_tags\1\15\0\0\tarea\tbase\abr\bcol\nembed\ahr\bimg\ninput\tlink\tmeta\nparam\vsource\ntrack\bwbr\14filetypes\1\0\2\14skip_tags\0\14filetypes\0\1\5\0\0\thtml\15javascript\20typescriptreact\bvue\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/onedark.vim",
    url = "https://github.com/joshdick/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n£\r\0\0\t\0003\0W6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2PÄ9\2\3\0015\4#\0005\5\5\0005\6\4\0=\6\6\0055\6\b\0005\a\a\0=\a\t\0065\a\n\0=\a\v\6=\6\f\0056\6\1\0'\b\r\0B\6\2\0029\6\14\6=\6\15\0054\6\0\0=\6\16\0056\6\1\0'\b\r\0B\6\2\0029\6\17\6=\6\18\0055\6\19\0=\6\20\0054\6\0\0=\6\21\0055\6\22\0=\6\23\0055\6\24\0=\6\25\0056\6\1\0'\b\26\0B\6\2\0029\6\27\0069\6\28\6=\6\29\0056\6\1\0'\b\26\0B\6\2\0029\6\30\0069\6\28\6=\6\31\0056\6\1\0'\b\26\0B\6\2\0029\6 \0069\6\28\6=\6!\0056\6\1\0'\b\26\0B\6\2\0029\6\"\6=\6\"\5=\5$\0045\5&\0005\6%\0=\6'\0055\6)\0005\a(\0=\a*\6=\6+\0055\6-\0005\a,\0=\a.\6=\6/\5=\0050\4B\2\2\0019\0021\1'\4'\0B\2\2\0019\0021\1'\4+\0B\2\2\0019\0021\1'\0042\0B\2\2\0019\0021\1'\4/\0B\2\2\1K\0\1\0\17file_browser\19load_extension\15extensions\fproject\14base_dirs\1\0\5\24sync_with_nvim_tree\2\rorder_by\basc\ntheme\rdropdown\17hidden_files\2\14base_dirs\0\1\2\0\0\16~/workspace\16media_files\14filetypes\1\0\2\rfind_cmd\arg\14filetypes\0\1\6\0\0\bpng\bjpg\bmp4\twebm\bpdf\bfzf\1\0\3\16media_files\0\fproject\0\bfzf\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\rdefaults\1\0\2\15extensions\0\rdefaults\0\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\vborder\17path_display\1\2\0\0\rtruncate\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\2\15horizontal\0\rvertical\0\1\0\1\vmirror\1\22vimgrep_arguments\1\0\23\22vimgrep_arguments\0\21sorting_strategy\15descending\19file_previewer\0\16borderchars\0\rwinblend\3\0\19grep_previewer\0\17path_display\0\19generic_sorter\0\25file_ignore_patterns\0\16file_sorter\0\18layout_config\0\27buffer_previewer_maker\0\20layout_strategy\15horizontal\21qflist_previewer\0\vborder\0\23selection_strategy\nreset\17initial_mode\vinsert\17entry_prefix\a  \20selection_caret\a> \18prompt_prefix\a> \fset_env\0\ruse_less\2\19color_devicons\2\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\nsetup\14telescope\frequire\npcall\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n¥\3\0\0\5\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0026\3\5\0009\3\6\0039\3\a\3=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\15float_opts\15highlights\1\0\2\15background\vNormal\vborder\vNormal\1\0\3\rwinblend\3\15\15highlights\0\vborder\vcurved\nshell\6o\bvim\20shade_filetypes\1\0\14\nshell\0\15float_opts\0\18close_on_exit\2\14direction\nfloat\17persist_size\2\22terminal_mappings\2\20insert_mappings\2\20start_in_insert\2\19shading_factor\3\2\20shade_terminals\2\20shade_filetypes\0\17hide_numbers\2\17open_mapping\n<C-\\>\tsize\3\20\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/samiahmadkhan/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n£\r\0\0\t\0003\0W6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2PÄ9\2\3\0015\4#\0005\5\5\0005\6\4\0=\6\6\0055\6\b\0005\a\a\0=\a\t\0065\a\n\0=\a\v\6=\6\f\0056\6\1\0'\b\r\0B\6\2\0029\6\14\6=\6\15\0054\6\0\0=\6\16\0056\6\1\0'\b\r\0B\6\2\0029\6\17\6=\6\18\0055\6\19\0=\6\20\0054\6\0\0=\6\21\0055\6\22\0=\6\23\0055\6\24\0=\6\25\0056\6\1\0'\b\26\0B\6\2\0029\6\27\0069\6\28\6=\6\29\0056\6\1\0'\b\26\0B\6\2\0029\6\30\0069\6\28\6=\6\31\0056\6\1\0'\b\26\0B\6\2\0029\6 \0069\6\28\6=\6!\0056\6\1\0'\b\26\0B\6\2\0029\6\"\6=\6\"\5=\5$\0045\5&\0005\6%\0=\6'\0055\6)\0005\a(\0=\a*\6=\6+\0055\6-\0005\a,\0=\a.\6=\6/\5=\0050\4B\2\2\0019\0021\1'\4'\0B\2\2\0019\0021\1'\4+\0B\2\2\0019\0021\1'\0042\0B\2\2\0019\0021\1'\4/\0B\2\2\1K\0\1\0\17file_browser\19load_extension\15extensions\fproject\14base_dirs\1\0\5\24sync_with_nvim_tree\2\rorder_by\basc\ntheme\rdropdown\17hidden_files\2\14base_dirs\0\1\2\0\0\16~/workspace\16media_files\14filetypes\1\0\2\rfind_cmd\arg\14filetypes\0\1\6\0\0\bpng\bjpg\bmp4\twebm\bpdf\bfzf\1\0\3\16media_files\0\fproject\0\bfzf\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\rdefaults\1\0\2\15extensions\0\rdefaults\0\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\vborder\17path_display\1\2\0\0\rtruncate\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\2\15horizontal\0\rvertical\0\1\0\1\vmirror\1\22vimgrep_arguments\1\0\23\22vimgrep_arguments\0\21sorting_strategy\15descending\19file_previewer\0\16borderchars\0\rwinblend\3\0\19grep_previewer\0\17path_display\0\19generic_sorter\0\25file_ignore_patterns\0\16file_sorter\0\18layout_config\0\27buffer_previewer_maker\0\20layout_strategy\15horizontal\21qflist_previewer\0\vborder\0\23selection_strategy\nreset\17initial_mode\vinsert\17entry_prefix\a  \20selection_caret\a> \18prompt_prefix\a> \fset_env\0\ruse_less\2\19color_devicons\2\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\nsetup\14telescope\frequire\npcall\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lsp-status.nvim
time([[Config for lsp-status.nvim]], true)
try_loadstring("\27LJ\2\nú\2\0\0\6\0\a\0\f6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\5Ä9\2\3\0015\4\4\0005\5\5\0=\5\6\4B\2\2\1K\0\1\0\19spinner_frames\1\v\0\0\b‚†ã\b‚†ô\b‚†π\b‚†∏\b‚†º\b‚†¥\b‚†¶\b‚†ß\b‚†á\b‚†è\1\0\a\19indicator_hint\tÔÅô \17indicator_ok\tÔÅò \19indicator_info\tÔÅö \19spinner_frames\0\23indicator_warnings\tÔÅ± \21indicator_errors\tÔÅó \18status_symbol\5\vconfig\15lsp-status\frequire\npcall\0", "config", "lsp-status.nvim")
time([[Config for lsp-status.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nD\0\0\4\0\4\0\t6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\2Ä6\2\3\0=\1\2\2K\0\1\0\bvim\vnotify\frequire\npcall\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n‹\4\0\0\a\0\18\0\0246\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\17Ä9\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0005\6\f\0=\6\r\5=\5\14\0045\5\15\0=\5\16\0044\5\0\0=\5\17\4B\2\2\1K\0\1\0\fmodules\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\2\venable\2\fkeymaps\0\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\1\2\0\0\5\21ensure_installed\1\0\b\19ignore_install\0\17sync_install\1\fmodules\0\14highlight\0\26incremental_selection\0\21ensure_installed\0\vindent\0\17auto_install\2\1\15\0\0\6c\blua\tjava\vpython\15javascript\ago\rmarkdown\tjson\tyaml\bvim\15typescript\velixir\theex\beex\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nê\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\3\0\0\20TelescopePrompt\bvim\1\0\2\21disable_filetype\0\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nG\0\0\4\0\4\0\t6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\2Ä9\2\3\1B\2\1\1K\0\1\0\nsetup\fcmp_lsp\frequire\npcall\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\nÔ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14skip_tags\1\15\0\0\tarea\tbase\abr\bcol\nembed\ahr\bimg\ninput\tlink\tmeta\nparam\vsource\ntrack\bwbr\14filetypes\1\0\2\14skip_tags\0\14filetypes\0\1\5\0\0\thtml\15javascript\20typescriptreact\bvue\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nû\b\0\0\5\0 \0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\16\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\3=\3\17\0025\3\19\0005\4\18\0=\4\5\0035\4\20\0=\4\a\0035\4\21\0=\4\t\0035\4\22\0=\4\v\0035\4\23\0=\4\r\0035\4\24\0=\4\15\3=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\19preview_config\1\0\5\brow\3\0\bcol\3\1\rrelative\vcursor\vborder\vsingle\nstyle\fminimal\28current_line_blame_opts\1\0\6\23virt_text_priority\3d\22ignore_whitespace\1\ndelay\3Ë\a\18virt_text_pos\beol\14virt_text\2\14use_focus\2\17watch_gitdir\1\0\1\17follow_files\2\17signs_staged\1\0\1\ttext\b‚îÜ\1\0\1\ttext\6~\1\0\1\ttext\b‚Äæ\1\0\1\ttext\6_\1\0\1\ttext\b‚îÉ\1\0\6\vdelete\0\vchange\0\14untracked\0\badd\0\17changedelete\0\14topdelete\0\1\0\1\ttext\b‚îÉ\nsigns\1\0\17\24signs_staged_enable\2\17signs_staged\0\18sign_priority\3\6\19preview_config\0\20max_file_length\3¿∏\2\20update_debounce\3d\nsigns\0!current_line_blame_formatter+<author>, <author_time:%R> - <summary>\28current_line_blame_opts\0\23current_line_blame\1\24attach_to_untracked\1\16auto_attach\2\17watch_gitdir\0\14word_diff\1\vlinehl\1\nnumhl\1\15signcolumn\2\14untracked\1\0\1\ttext\b‚îÜ\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\b‚Äæ\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\b‚îÉ\badd\1\0\6\vdelete\0\vchange\0\14untracked\0\badd\0\17changedelete\0\14topdelete\0\1\0\1\ttext\b‚îÉ\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\nπ\4\0\0\6\0\17\0\0256\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\nÄ9\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\4B\2\2\1X\2\bÄ6\2\v\0009\2\f\2'\4\r\0006\5\v\0009\5\14\0059\5\15\0059\5\16\5B\2\3\1K\0\1\0\nERROR\vlevels\blog\25Error loading Aerial\vnotify\bvim\fkeymaps\1\0\t\14<leader>a\vtoggle\18<2-LeftMouse>\17actions.jump\t<CR>\17actions.jump\6{\17actions.prev\6}\17actions.next\n<C-k>\26actions.up_and_scroll\n<C-j>\28actions.down_and_scroll\a]]\20actions.next_up\a[[\20actions.prev_up\vlayout\1\0\2\22default_direction\17prefer_right\14min_width\3\30\rbackends\1\0\a\16attach_mode\vglobal\fkeymaps\0\vlayout\0\rbackends\0\14nerd_font\tauto\22highlight_closest\2\17manage_folds\2\1\4\0\0\blsp\15treesitter\rmarkdown\nsetup\vaerial\frequire\npcall\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\5\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\3Ä9\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\tleap\frequire\npcall\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: neovim-ayu
time([[Config for neovim-ayu]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\14overrides\1\0\2\14overrides\0\vmirage\2\nsetup\bayu\frequire\0", "config", "neovim-ayu")
time([[Config for neovim-ayu]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n¥\3\0\0\5\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0026\3\5\0009\3\6\0039\3\a\3=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\15float_opts\15highlights\1\0\2\15background\vNormal\vborder\vNormal\1\0\3\rwinblend\3\15\15highlights\0\vborder\vcurved\nshell\6o\bvim\20shade_filetypes\1\0\14\nshell\0\15float_opts\0\18close_on_exit\2\14direction\nfloat\17persist_size\2\22terminal_mappings\2\20insert_mappings\2\20start_in_insert\2\19shading_factor\3\2\20shade_terminals\2\20shade_filetypes\0\17hide_numbers\2\17open_mapping\n<C-\\>\tsize\3\20\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\nç\2\0\0\6\0\a\0\f6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\5Ä9\2\3\0015\4\5\0005\5\4\0=\5\6\4B\2\2\1K\0\1\0\rmappings\1\0\b\24attach_to_untracked\0\rrelative\0\25cursor_scrolls_alone\2\22respect_scrolloff\1\rstop_eof\2\16hide_cursor\2\21performance_mode\1\rmappings\0\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\npcall\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n›\b\0\0\t\0%\0:6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\0023Ä9\2\3\0015\4\n\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\0054\6\0\0=\6\t\5=\5\v\0045\5\r\0005\6\f\0=\6\14\0055\6\15\0=\6\16\0054\6\3\0005\a\17\0>\a\1\0065\a\18\0005\b\19\0=\b\20\a5\b\21\0=\b\22\a>\a\2\6=\6\23\0054\6\3\0005\a\24\0>\a\1\6=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\5=\5\30\0045\5\31\0004\6\0\0=\6\14\0054\6\0\0=\6\16\0055\6 \0=\6\23\0055\6!\0=\6\25\0054\6\0\0=\6\27\0054\6\0\0=\6\29\5=\5\"\0045\5#\0=\5$\4B\2\2\1K\0\1\0\15extensions\1\4\0\0\rfugitive\14nvim-tree\rquickfix\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\6\14lualine_b\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_c\0\14lualine_y\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\vcolors\1\0\6\20lsp_client_name\f#ffffff\buse\2\fmessage\f#ffffff\ntitle\f#ffffff\15percentage\f#ffffff\fspinner\f#ffffff\23display_components\1\4\0\0\20lsp_client_name\fspinner\15percentage\1\2\2\0\17lsp_progress\vcolors\0\23display_components\0\1\2\2\0\rfilename\tpath\3\1\16file_status\2\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\6\14lualine_b\0\14lualine_x\0\14lualine_a\0\14lualine_z\0\14lualine_c\0\14lualine_y\0\1\2\0\0\tmode\foptions\1\0\4\22inactive_sections\0\15extensions\0\rsections\0\foptions\0\23disabled_filetypes\25component_separators\1\3\0\0\bÓÇ±\bÓÇ≥\23section_separators\1\3\0\0\bÓÇ∞\bÓÇ≤\1\0\4\ntheme\tauto\23section_separators\0\25component_separators\0\23disabled_filetypes\0\nsetup\flualine\frequire\npcall\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nM\0\0\5\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\3Ä9\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\14nvim-tree\frequire\npcall\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd mason-lspconfig.nvim ]]

-- Config for: mason-lspconfig.nvim
try_loadstring("\27LJ\2\n∑\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\21ensure_installed\0\1\v\0\0\rtsserver\veslint\vjsonls\thtml\ncssls\fpyright\ngopls\njdtls\vlua_ls\vclangd\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")

vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15lsp_config\frequire\0", "config", "nvim-lspconfig")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
