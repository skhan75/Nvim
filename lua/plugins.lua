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
  -- Autocommand that reloads neovim whenever you save the plugins.lua file
  -- vim.cmd [[
  --   augroup packer_user_config
  --       autocmd!
  --       autocmd BufWritePost plugins.lua source <afile> | PackerSync
  --   augroup end
  -- ]]
  vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
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

    -- Development
    -- use { "tpope/vim-fugitive", event = "BufRead" }
    -- use({
    --   "kylechui/nvim-surround",
    --   tag = "*", -- Use for stability; omit to use `main` branch for the 
    --   after = "nvim-treesitter",
    -- })
    -- use { "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } }
    -- use { "easymotion/vim-easymotion", event = "BufRead" }
    use {
      "folke/which-key.nvim",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    use { "majutsushi/tagbar" }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Internal
    use { "/home/khansa/workspace/nvim-plugins/basicplugin.nvim"}

    -- Movement
    use { 
      "karb94/neoscroll.nvim",
      config = function() 
        require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
            '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
          hide_cursor = true,          -- Hide cursor while scrolling
          stop_eof = true,             -- Stop at <EOF> when scrolling downwards
          respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil,       -- Default easing function
          pre_hook = nil,              -- Function to run before the scrolling animation starts
          post_hook = nil,             -- Function to run after the scrolling animation ends
          performance_mode = false,    -- Disable "Performance Mode" on all buffers.
        })
      end
    }

    -- Themes
    use {
      "mhartington/oceanic-next",
      "sainnhe/gruvbox-material",
      "folke/tokyonight.nvim",
      "EdenEast/nightfox.nvim",
      {
        "Julpikar/night-owl.nvim",
        config = function() -- move config to respective theme to change
          vim.cmd [[
            if(has("termguicolors"))
            set termguicolors
            endif

            syntax enable
            colorscheme night-owl
            set background=dark
            ]]
        end
      }
    }

    -- Nvim Tree
    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons",
      },
      tag = "nightly",
      config = function()
        require("config.nvim-tree").setup()
      end,
    }

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("config.telescope").setup()
      end,
    }
    use { "nvim-telescope/telescope-media-files.nvim" }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-project.nvim" }

    -- Status Line
    use {
      "nvim-lualine/lualine.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
        {
          "SmiteshP/nvim-gps",
          module = "nvim-gps",
          config = function()
            require("nvim-gps").setup()
          end,
        }
      },
      config = function()
        require("config.lualine").setup()
      end
    }

    -- Tab
    use {
      "romgrk/barbar.nvim",
      requires = { "kyazdani42/nvim-web-devicons" }
    }

    -- -- Project settings
    use {
      "ahmedkhalf/project.nvim",
      event = "VimEnter",
      config = function()
        require("config.project").setup()
      end,
    }

    -- LSP
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "simrat39/rust-tools.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "christianchiarulli/lua-dev.nvim",
      "b0o/SchemaStore.nvim"
    }
    use {
      "neovim/nvim-lspconfig",
      as = "nvim-lspconfig",
      after = "nvim-treesitter",
      config = function()
        require("config.lsp").setup()
        -- require("config.dap").setup()
      end,
    }

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "quangnguyen30192/cmp-nvim-ultisnips",
        config = function()
          -- optional call to setup (see customization section)
          require("cmp_nvim_ultisnips").setup {}
        end,
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-cmdline",
        "octaltree/cmp-look",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
      },
      config = function()
        require("config.cmp").setup()
      end,
    }

    -- Snippets
    use {
      "SirVer/ultisnips",
      requires = { { "honza/vim-snippets", rtp = "." }, "mlaursen/vim-react-snippets" },
      config = function()
        vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
        vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
        vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
        vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end,
    }

    use {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init()
      end,
    }

    use {
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function()
        require("config.autopairs").setup()
      end,
    }

    -- Better Syntax (TreeSitter)
    use {
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
      config = function()
        require("config.treesitter").setup()
      end,
    }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use {
      "p00f/nvim-ts-rainbow",
      after = "nvim-treesitter"
    }
    use {
      "nvim-treesitter/playground",
      cmd = "TSHighlightCapturesUnderCursor",
      after = "nvim-treesitter",
    }
    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
    }
    use {
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
      config = function()
        require("nvim-ts-autotag").setup { enable = true }
      end,
    }


    -- Markdown
    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })

  end

  pcall(require, "impatient")
  pcall(require, "packer_compiled")
  require("packer").init(conf)
  require("packer").startup(plugins)
end

return M
