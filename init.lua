-- =========================
-- Basic Settings
-- =========================

-- Line numbers
vim.opt.number = true
-- vim.opt.relativenumber = true

-- Enable mouse
vim.opt.mouse = "a"

-- Better colors
vim.opt.termguicolors = true

-- Tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Cursor line
vim.opt.cursorline = true

-- =========================
-- Syntax Highlighting
-- =========================

vim.cmd("syntax on")

-- =========================
-- Install Lazy.nvim Plugin Manager
-- =========================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- =========================
-- Plugins
-- =========================

require("lazy").setup({
    -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "rebelot/kanagawa.nvim",
    },
    {
        "navarasu/onedark.nvim",
    },
    {
        "ellisonleao/gruvbox.nvim",
    },
    {
        "neanias/everforest-nvim",
    },
    {
        "EdenEast/nightfox.nvim",
    },
    {
        "marko-cerovac/material.nvim",
    },
    { 
        'kepano/flexoki-neovim', name = 'flexoki' 
    },
    {
        "rktjmp/lush.nvim",
        -- if you wish to use your own colorscheme:
        -- { dir = '/absolute/path/to/colorscheme', lazy = true },
    },
    -- Rainbow Brackets
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("rainbow-delimiters.setup").setup({})
        end,
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },

    -- Sidebar
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
})

require("tokyonight").setup({
    style = "storm",
    -- style = "moon",
    -- style = "night",
    -- style = "day",
})

require("catppuccin").setup({
    -- flavour = "latte",
    -- flavour = "mocha",
    -- flavour = "frappe",
    flavour = "macchiato",
})

require("kanagawa").setup({
    -- theme = "wave",
    -- theme = "dragon",
    theme = "lotus",
})

require("everforest").setup({
    background = "soft",
    -- background = "medium",
    -- background = "hard",
})

require("material").setup({
    -- style = "deep ocean",
    -- style = "darker",
    -- style = "lighter",
    -- style = "oceanic",
    style = "palenight",
})


-- =========================
-- Colorscheme
-- =========================

vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("habamax")
-- vim.cmd.colorscheme("elflord")
-- vim.cmd.colorscheme("onedark")
-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd.colorscheme("everforest")
-- vim.cmd.colorscheme("material")
-- Nightfox variants
-- vim.cmd.colorscheme("nightfox")
-- vim.cmd.colorscheme("carbonfox")
-- vim.cmd.colorscheme("nordfox")
-- vim.cmd.colorscheme("terafox")
-- vim.cmd.colorscheme("dawnfox")
-- vim.cmd.colorscheme("duskfox")
-- flexoki
-- vim.cmd('colorscheme flexoki-dark')
-- vim.cmd('colorscheme flexoki-light')
-- Not working
-- vim.cmd('lush')

-- =========================
-- Treesitter Setup
-- =========================

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua",
        "python",
        "cpp",
        "c",
        "javascript",
        "typescript",
        "bash",
        "json",
        "html",
        "css",
        "markdown",
        "vim",
        "yaml",
    },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
    },
})

-- Rainbow brackets
require("rainbow-delimiters.setup").setup({
    strategy = {
        [""] = require("rainbow-delimiters").strategy["global"],
    },
    highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
    },
})

-- Statusline
require("lualine").setup({
    options = {
        theme = "auto",
        section_separators = "",
        component_separators = "",
    },
})

-- Sidebar
require("nvim-tree").setup()
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")


-- Better cursor
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20"

-- Smooth Syntax
vim.api.nvim_set_hl(0, "Comment", {
    italic = true
})
vim.api.nvim_set_hl(0, "Function", {
    bold = true
})

