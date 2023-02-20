local M = {}

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
local indent = 2

local options = {
    -- General
    mouse = 'a', -- Enable mouse support
    clipboard = 'unnamedplus', -- Copy/paste to show on system board
    swapfile = false, -- Creates a swapfile
    completeopt = 'menuone,noselect', -- Autocomplete options
    relativenumber = true, -- Set relative number lines
    ruler = true, -- Always show cursor position
    laststatus = 2, -- Always display the status bar
    incsearch = true, -- Incremental search that shows partial matches
    showmatch = true,
    visualbell = true, -- Flash the screen instead of beeping on errors
    scrolloff = 8,
    conceallevel = 0, -- So that `` is visible in markdown files
    -- Set the behavior of tab
    tabstop = indent,
    shiftwidth = indent,
    softtabstop = indent,
    expandtab = true,
    smartindent = true,
    -- Neovim UI
    number = true, -- Show line number
    foldmethod = 'marker', -- Enable folding
    colorcolumn = '80', -- Line length marker
    cmdheight = 1,
    splitright = true, -- Force all vertical splits to go to the right of current window
    splitbelow = true, -- Force all horizontal splits to go below current window
    cursorline = true,
    ignorecase = true, -- Ignore case letters when search
    smartcase = true, -- Ignore lowercase for the whole pattern
    linebreak = true, -- Wrap on word boundary
    termguicolors = true, -- Enable 24-bit RGB colors
    wrap = true,
    background = 'dark',
    -- Memory, CPU
    hidden = true,
    history = 100, -- Remember N lines in history
    lazyredraw = true, -- Faster scrolling
    synmaxcol = 240, -- Max column for syntax highlight
    updatetime = 300, -- ms to wait for trigger 'document_highlight'
}

function M.setup() 
    cmd [[filetype plugin indent on]]
    cmd [[syntax enable]]

    opt.shortmess:append "c"

    for k, v in pairs(options) do
        vim.opt[k] = v
    end

    cmd "set whichwrap+=<,>,[,],h,l"
    cmd [[set iskeyword+=-]]
    cmd ':set nohlsearch'


    opt.formatoptions = opt.formatoptions
        -- - "a" -- Auto formatting is BAD.
        -- - "t" -- Don't auto format my code. I got linters for that.
        + "c" -- In general, I like it when comments respect textwidth
        + "q" -- Allow formatting comments w/ gq
        - "o" -- O and o, don't continue comments
        - "r" -- Don't insert comment after <Enter>
        + "n" -- Indent past the formatlistpat, not underneath it.
        -- + "j" -- Auto-remove comments if possible.
        -- - "2" -- I'm not in gradeschool anymore

    g.vim_markdown_fenced_languages = {
        "html",
        "javascript",
        "typescript",
        "css",
        "python",
        "lua",
        "vim"
    }

    g.maplocalleader = " "
    g.mapleader = " "
end

M.setup()
