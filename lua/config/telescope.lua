local M = {}

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

function M.setup()
  require("telescope").load_extension "fzf"
  require("telescope").load_extension "project"
  require("telescope").load_extension "media_files"
  require("telescope").load_extension "file_browser"
  -- P.S. live_grep and grep_string requires RipGrep to be installed first

  local actions = require "telescope.actions"

  telescope.setup {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { height = 0.5, width = 0.5, preview_width = 0.6 },
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-u>"] = actions.results_scrolling_up,
          ["<C-d>"] = actions.results_scrolling_down,
          ["<C-c>"] = actions.close,
          --["<c-d>"] = require("telescope.actions").delete_buffer,
        },
        n = {
          ["<esc>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,
          ["<C-c>"] = actions.close,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        }
      },
      file_ignore_patterns = {
        ".local",
        "ctags",
        ".cache",
        ".git/",
        "target/",
        "docs/",
        "vendor/*",
        "%.lock",
        "__pycache__/*",
        "%.sqlite3",
        "%.ipynb",
        "node_modules/*",
        -- "%.jpg",
        -- "%.jpeg",
        -- "%.png",
        "%.svg",
        "%.otf",
        "%.ttf",
        "%.webp",
        ".dart_tool/",
        ".github/",
        ".gradle/",
        ".idea/",
        ".settings/",
        ".vscode/",
        "__pycache__/",
        "build/",
        "env/",
        "gradle/",
        "node_modules/",
        "%.pdb",
        "%.dll",
        "%.class",
        "%.exe",
        "%.cache",
        "%.ico",
        "%.pdf",
        "%.dylib",
        "%.jar",
        "%.docx",
        "%.met",
        "smalljre_*/*",
        ".vale/",
        "%.burp",
        "%.mp4",
        "%.mkv",
        "%.rar",
        "%.zip",
        "%.7z",
        "%.tar",
        "%.bz2",
        "%.epub",
        "%.flac",
        "%.tar.gz",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        theme = "dropdown",
      },
      grep_string = {
        theme = "dropdown",
      },
      -- find_files = {
      --   theme = "dropdown",
      --   previewer = false,
      -- },
      buffers = {
        theme = "dropdown",
previewer = false,
        initial_mode = "normal",
      },
      planets = {
        show_pluto = true,
        show_moon = true,
      },
      colorscheme = {
        enable_preview = true,
      },
      lsp_references = {
  theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    extensions = {
      -- arecibo = {
      --     ["selected_engine"] = "google",
      --     ["url_open_command"] = "xdg-open",
      --     ["show_http_headers"] = false,
      --     ["show_domain_icons"] = false,
      -- },
      fzf = {
        override_generic_sorter = false,
        override_file_sorter = true,
        case_mode = "smart_case",
        fuzzy = true,
      },
      media_files = {
        filetypes = { "png", "jpg", "mp4", "webm", "pdf", "gif" },
      },
      -- bookmarks = {
      --     selected_browser = "brave",
      --     url_open_command = "xdg-open",
      --     url_open_plugin = "open_browser",
      --     firefox_profile_name = nil,
      -- },
    },
  }

  -- require("telescope").load_extension "bookmarks"
  -- require("telescope").load_extension "neoclip"
  -- require("telescope").load_extension "zoxide"
-- require("telescope").load_extension "ultisnips"


end

return M
