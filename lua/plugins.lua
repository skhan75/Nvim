local M = {}

local function packer_init()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    local packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd [[packadd packer.nvim]]
  end
end

packer_init()

function M.setup()
  local conf = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  local function plugins(use)
    -- Have packer manage itself
    use { "wbthomason/packer.nvim" }

    -- Speed up loading Lua modules in Neovim to improve startup time
    use { "lewis6991/impatient.nvim" }

    use {
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end,
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup({
          -- Optional: Add any desired configuration here
        })
      end,
    }


    -- Nvim Tree File Explorer
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
      config = function()
        local ok, nvim_tree = pcall(require, 'nvim-tree')
        if ok then
          nvim_tree.setup {}
        end
      end
    }

    -- Better Syntax (TreeSitter)
    use {
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
      config = function()
        local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
        if ok then
          treesitter.setup {
            ensure_installed = { "c", "lua", "java", "python", "javascript", "go", "markdown", "json", "yaml", "vim", "typescript", "elixir", "heex", "eex" },
            sync_install = false,  -- Install parsers synchronously (only applied to `ensure_installed`)
            ignore_install = { "" }, -- List of parsers to ignore installing
            auto_install = true,

            highlight = {
              enable = true,              -- false will disable the whole extension
              additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
              enable = true,
              keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
              },
            },
            indent = { enable = true },
            modules = {},
          }
        end
      end,
    }

    -- Themes
    use 'joshdick/onedark.vim'
    use 'folke/tokyonight.nvim'
    use 'mhartington/oceanic-next'
    use 'EdenEast/nightfox.nvim'
    use 'Mofiqul/dracula.nvim'
    use 'catppuccin/nvim'
    use 'Julpikar/night-owl.nvim'
    use { "ellisonleao/gruvbox.nvim" }
    use {
      'Shatur/neovim-ayu',
      config = function()
        require('ayu').setup({
          mirage = true,
          overrides = {},
        })
      end
    }

    -- Movement
    use {
      "karb94/neoscroll.nvim",
      config = function()
        local ok, neoscroll = pcall(require, 'neoscroll')
        if ok then
          neoscroll.setup({
            mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
              '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
            hide_cursor = true,
            stop_eof = true,
            respect_scrolloff = false,
            cursor_scrolls_alone = true,
            easing_function = nil,
            pre_hook = nil,
            post_hook = nil,
            performance_mode = false,
          })
        end
      end
    }
    use {
      "romgrk/barbar.nvim",
      requires = { "kyazdani42/nvim-web-devicons" }
    }

    -- Telescope fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = function()
        local ok, telescope = pcall(require, 'telescope')
        if ok then
          telescope.setup {
            defaults = {
              vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case'
              },
              prompt_prefix = "> ",
              selection_caret = "> ",
              entry_prefix = "  ",
              initial_mode = "insert",
              selection_strategy = "reset",
              sorting_strategy = "descending",
              layout_strategy = "horizontal",
              layout_config = {
                horizontal = {
                  mirror = false,
                },
                vertical = {
                  mirror = false,
                },
              },
              file_sorter = require'telescope.sorters'.get_fuzzy_file,
              file_ignore_patterns = {},
              generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
              path_display = { "truncate" },
              winblend = 0,
              border = {},
              borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
              color_devicons = true,
              use_less = true,
              set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
              file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
              grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
              qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
              -- Developer configurations: Not meant for general override
              buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
            },
            extensions = {
              fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
              },
              media_files = {
                filetypes = {"png", "jpg", "mp4", "webm", "pdf"},
                find_cmd = "rg" -- find command (defaults to `fd`)
              },
              project = {
                base_dirs = {
                  '~/workspace',
                },
                hidden_files = true, -- default: false
                theme = "dropdown",
                order_by = "asc",
                sync_with_nvim_tree = true, -- default: false
              }
            }
          }
          telescope.load_extension('fzf')
          telescope.load_extension('media_files')
          telescope.load_extension('file_browser')
          telescope.load_extension('project')
        end
      end
    }

    -- Telescope Extensions
    use { "nvim-telescope/telescope-media-files.nvim" }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-project.nvim" }

    -- LSP Configuration and Plugins
    use {
      'williamboman/mason.nvim',
      config = function()
        require("mason").setup()
      end
    }

    use {
      'williamboman/mason-lspconfig.nvim',
      after = "mason.nvim",  -- Ensure this runs after mason.nvim
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = {
            "tsserver",        -- TypeScript and JavaScript
            "eslint",          -- Linter for JavaScript/TypeScript
            "jsonls",          -- JSON
            "html",            -- HTML (for React)
            "cssls",           -- CSS (for React)
            "pyright",         -- Python
            "gopls",           -- Go
            "jdtls",           -- Java
            "lua_ls",          -- Lua (Updated from sumneko_lua)
            "clangd",          -- C/C++
          },
        })
      end
    }

    use {
      'neovim/nvim-lspconfig',   -- Collection of configurations for the built-in LSP client
      after = "mason-lspconfig.nvim",  -- Ensure this runs after mason-lspconfig.nvim
      config = function()
        require('lsp_config')
      end
    }


    use {
      'hrsh7th/nvim-cmp', -- The completion plugin
      requires = {
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        'hrsh7th/cmp-buffer', -- Buffer source for nvim-cmp
        'hrsh7th/cmp-path', -- Path source for nvim-cmp
        'hrsh7th/cmp-cmdline', -- Command line source for nvim-cmp
        'L3MON4D3/LuaSnip', -- Snippet engine
        'saadparwaiz1/cmp_luasnip', -- Snippet source for nvim-cmp
        'rafamadriz/friendly-snippets', -- A bunch of snippets to use
      },
      config = function()
        local ok, cmp_lsp = pcall(require, 'cmp_lsp')
        if ok then
          cmp_lsp.setup()
        end
      end
    }

    -- Pretty printing errors
    use {
      'rcarriga/nvim-notify',
      config = function()
        local ok, notify = pcall(require, 'notify')
        if ok then
          vim.notify = notify
        end
      end
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- Optional for file icons
      config = function()
        local ok, lualine = pcall(require, 'lualine')
        if ok then
          lualine.setup {
            options = {
              theme = 'auto', -- Automatically sets the theme based on your colorscheme
              section_separators = {'', ''}, -- Custom separators for sections
              component_separators = {'', ''}, -- Custom separators for components
              disabled_filetypes = {}, -- Filetypes to disable lualine in
            },
            sections = {
              lualine_a = {'mode'}, -- Display the current mode (e.g., INSERT, NORMAL)
              lualine_b = {'branch', 'diff', 'diagnostics'}, -- Git branch, diff, and diagnostics
              lualine_c = {
                {
                  'filename',
                  file_status = true, -- Display file status (readonly, modified)
                  path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
                },
                {
                  'lsp_progress',
                  display_components = { 'lsp_client_name', 'spinner', 'percentage' },
                  colors = {
                    percentage  = '#ffffff',
                    title  = '#ffffff',
                    message  = '#ffffff',
                    spinner = '#ffffff',
                    lsp_client_name = '#ffffff',
                    use = true,
                  },
                },
              },
              lualine_x = {
                {
                  'encoding', -- File encoding (e.g., utf-8)
                  'fileformat', -- File format (e.g., unix, dos)
                  'filetype', -- File type (e.g., python, lua)
                }
              },
              lualine_y = {'progress'}, -- Display progress in the file
              lualine_z = {'location'}, -- Display cursor location in the file
            },
            inactive_sections = {
              lualine_a = {},
              lualine_b = {},
              lualine_c = {'filename'},
              lualine_x = {'location'},
              lualine_y = {},
              lualine_z = {}
            },
            extensions = {'fugitive', 'nvim-tree', 'quickfix'}
          }
        end
      end
    }

    use {
      'nvim-lua/lsp-status.nvim',
      config = function()
        local ok, lsp_status = pcall(require, 'lsp-status')
        if ok then
          lsp_status.config({
            status_symbol = '',
            indicator_errors = ' ',
            indicator_warnings = ' ',
            indicator_info = ' ',
            indicator_hint = ' ',
            indicator_ok = ' ',
            spinner_frames = {'⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'},
          })
        end
      end
    }

    -- Easy Motion
    use {
      'ggandor/leap.nvim',
      config = function()
        local ok, leap = pcall(require, 'leap')
        if ok then
          leap.setup({
            --max_phase_one_targets = nil,
            --highlight_unlabeled_phase_one_targets = true,
            --max_highlighted_traversal_targets = 10,
            --case_sensitive = false,
            --equivalence_classes = { ' \t\r\n', '.' }, -- treat space and tab as equivalent
            --substitute_chars = {},
            --safe_labels = { 's', 'f', 'n', 'u', 't', '/'},
            --labels = { 's', 'f', 'n', 'u', 't', '/', 'S', 'F', 'N', 'U', 'T', '?'},
            --special_keys = {
            --  repeat_search = ';',
            --  next_phase_one_target = '<enter>',
            --  next_target = {';', '<enter>'},
            --  next_group = '<space>',
            --  prev_target = {',', '<tab>'},
            --},
          })
        end
      end
    }

    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({
          check_ts = true,  -- Enable Treesitter integration
          disable_filetype = { "TelescopePrompt", "vim" },  -- Disable in specific filetypes
        })
      end
    }

    --use {
    --  "p00f/nvim-ts-rainbow",
    --  after = "nvim-treesitter"
    --}

    use {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup({
          filetypes = { "html", "javascript", "typescriptreact", "vue" }, -- Enable for these file types
          skip_tags = { "area", "base", "br", "col", "embed", "hr", "img", "input", "link", "meta", "param", "source", "track", "wbr" }
        })
      end
    }

    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    }

    -- Formatting
    use { 'mhartington/formatter.nvim' }

    use {
      'stevearc/aerial.nvim',
      config = function()
        local ok, aerial = pcall(require, 'aerial')
        if ok then
          aerial.setup({
            -- Choose which backends to use for symbol outlines
            backends = { "lsp", "treesitter", "markdown" },
            -- Customize aerial’s layout and position
            layout = {
              default_direction = 'prefer_right',
              min_width = 30,
            },
            manage_folds = true,
            highlight_closest = true,
            nerd_font = "auto",
            -- Control how aerial attaches to buffers
            attach_mode = 'global',

            -- Customize keymaps within the aerial buffer for navigation
            -- You can also set these in your normal configuration if you prefer
            keymaps = {
              ["<CR>"] = "actions.jump",         -- Jump to symbol definition on <CR>
              ["<2-LeftMouse>"] = "actions.jump", -- Jump to symbol definition on double-click
              ["<leader>a"] = "toggle",           -- Toggle aerial with <leader>a
              ["{"] = "actions.prev",
              ["}"] = "actions.next",
              ["[["] = "actions.prev_up",
              ["]]"] = "actions.next_up",
              ["<C-j>"] = "actions.down_and_scroll",
              ["<C-k>"] = "actions.up_and_scroll",
            },
          })
        else
          vim.notify("Error loading Aerial", vim.log.levels.ERROR)
        end
      end
    }

    use {
      'ThePrimeagen/harpoon',
      requires = { 'nvim-lua/plenary.nvim' } -- Harpoon depends on plenary.nvim
    }

    -- Terminal Configurations
    use {"akinsho/toggleterm.nvim", tag = '*',
      config = function ()
        require("toggleterm").setup{
          size = 20,
          open_mapping = [[<C-\>]], -- Keybinding to toggle the terminal
          hide_numbers = true, -- Hide line numbers in terminal buffers
          shade_filetypes = {},
          shade_terminals = true,
          shading_factor = 2, -- Dim the terminal
          start_in_insert = true, -- Start terminal in insert mode
          insert_mappings = true, -- Allow open mapping in insert mode
          terminal_mappings = true, -- Use terminal mapping
          persist_size = true,
          direction = 'float', -- Open terminal as a floating window
          close_on_exit = true, -- Close terminal when the process exits
          shell = vim.o.shell, -- Use the default shell
          float_opts = {
            border = 'curved', -- Border style: single, double, shadow, curved, etc.
            winblend = 15, -- Transparency of the floating window
            highlights = {
              border = "Normal",
              background = "Normal",
            }
          }
        }
      end
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup {
          signs = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
          },
          signs_staged = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
          },
          signs_staged_enable = true,
          signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
          numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
          linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
          word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
          watch_gitdir = {
            follow_files = true,
          },
          auto_attach = true,
          attach_to_untracked = false,
          current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
          current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
            use_focus = true,
          },
          current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
          sign_priority = 6,
          update_debounce = 100,
          status_formatter = nil, -- Use default
          max_file_length = 40000, -- Disable if file is longer than this (in lines)
          preview_config = {
            -- Options passed to `nvim_open_win`
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1,
          },
        }
      end
    }

  end

  pcall(require, "impatient")
  pcall(require, "packer_compiled")
  require("packer").init(conf)
  require("packer").startup(plugins)

end
return M

