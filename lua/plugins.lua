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
  --Autocommand that reloads neovim whenever you save the plugins.lua file
  vim.cmd [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
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
    use { "wbthomason/packer.nvim" }

    -- Development
    use({
      "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the 
      after = "nvim-treesitter",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    })
    use {
      "folke/which-key.nvim",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    use { "majutsushi/tagbar" }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

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

    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    -- Themes
    use { "bluz71/vim-moonfly-colors", as = "moonfly" }
    use {
      "mhartington/oceanic-next",
      "sainnhe/gruvbox-material",
      "bluz71/vim-nightfly-colors", as = "nightfly",
      "EdenEast/nightfox.nvim",
      "Julpikar/night-owl.nvim",
      {
        "tiagovla/tokyodark.nvim",
        config = function() -- move config to respective theme to change
          vim.g.tokyodark_transparent_background = false
          vim.g.tokyodark_enable_italic_comment = true
          vim.g.tokyodark_enable_italic = false
          vim.cmd [[ colorscheme night-owl ]]
        end
      }
    }

    use {
      "xiyaowong/nvim-transparent",
      config = function()
        require("transparent").setup({
          extra_groups = { -- table/string: additional groups that should be cleared
            -- In particular, when you set it to 'all', that means all available groups
            -- example of akinsho/nvim-bufferline.lua
            "BufferLineTabClose",
            "BufferlineBufferSelected",
            "BufferLineFill",
            "BufferLineBackground",
            "BufferLineSeparator",
            "BufferLineIndicatorSelected",
          },
          exclude_groups = {}, -- table: groups you don't want to clear
        })
      end
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

    -- Project settings
    use {
      "ahmedkhalf/project.nvim",
      event = "VimEnter",
      config = function()
        require("config.project").setup()
      end,
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      as = "nvim-lspconfig",
      after = "nvim-treesitter",
      config = function()
        require("config.lsp").setup()
      end,
    }

    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "simrat39/rust-tools.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "christianchiarulli/lua-dev.nvim",
      "b0o/SchemaStore.nvim"
    }

    -- Copilot
    -- use { "github/copilot.vim" }

    -- Snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-calc",
        "octaltree/cmp-look",
        "f3fora/cmp-spell",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
      },
      config = function()
        require("config.cmp").setup()
      end,
    }

    use { 'morgsmccauley/vim-react-native-snippets' }

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
    use {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    }

  end

  pcall(require, "impatient")
  pcall(require, "packer_compiled")
  require("packer").init(conf)
  require("packer").startup(plugins)
end

return M
