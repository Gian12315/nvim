local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "wbthomason/packer.nvim", -- Have packer manage itself
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("user.config.treesitter")
        end,
        dependencies = { "RRethy/nvim-treesitter-textsubjects", "windwp/nvim-ts-autotag" },
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("user.config.mason")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("user.config.mason.lsp")
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        config = function()
            require("user.config.mason.null_ls")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("user.config.lsp")
        end,
    },

    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("user.config.trouble")
        end,
        cmd = { "Trouble", "TroubleToggle" },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("user.config.null-ls")
        end,
    },

    -- LuaSnip and nvim-cmp are to be installed together.
    {
        "L3MON4D3/LuaSnip",
        dependencies = { { "rafamadriz/friendly-snippets", lazy = true } },
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("user.config.nvim-cmp")
        end,
        dependencies = {
            { "onsails/lspkind.nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-calc" },
            { "hrsh7th/cmp-path" },
            { "ray-x/cmp-treesitter", dependencies = "nvim-treesitter/nvim-treesitter" },
        },
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("user.config.nvim-autopairs")
        end,
    },
    "norcalli/nvim-colorizer.lua",

    {
        "folke/which-key.nvim",
        config = function()
            require("user.config.which-key")
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("user.config.telescope")
        end,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
    },

    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("user.config.gitsigns")
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("user.config.comment")
        end,
    },

    {
        "kylechui/nvim-surround",
        config = function()
            require("user.config.nvim-surround")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("user.config.lualine")
        end,
    },

    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("user.config.nvim-tree")
        end,
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },

    "tpope/vim-repeat",

    "lunarvim/darkplus.nvim",

    "marko-cerovac/material.nvim",

    {
        "j-hui/fidget.nvim",
        config = function()
            require("user.config.fidget")
        end,
    },
    "lewis6991/impatient.nvim",

    -- Tabbar

    {
        "akinsho/bufferline.nvim",
        version = "v2.*",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("user.config.bufferline")
        end,
    },

    "moll/vim-bbye",

    {
        "karb94/neoscroll.nvim",
        config = function()
            require("user.config.neoscroll")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("user.config.indent-blankline")
        end,
    },

    -- Misc
    {
        "goolord/alpha-nvim",
        config = function()
            require("user.config.alpha")
        end,
    },
    {
        "ellisonleao/carbon-now.nvim",
        cmd = "CarbonNow",
        config = function()
            require("user.config.carbon")
        end,
    },
    "andweeb/presence.nvim",
    { "max397574/better-escape.nvim", config = [[require("user.config.better-escape")]] },
    "RRethy/vim-illuminate",

    -- DAP
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("user.config.dap")
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("user.config.dap.ui")
        end,
    },

    -- Zen
    {
        "folke/twilight.nvim",
        config = function()
            require("user.config.twilight")
        end,
    },
    {
        "Pocco81/true-zen.nvim",
        config = function()
            require("user.config.zen")
        end,
        cmd = { "TZAtaraxis", "TZMinimalist", "TZNarrow", "TZFocus" },
    },

    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    {
        "ggandor/leap.nvim",
        config = function()
            require("user.config.leap")
        end,
    },

    -- NeOrg
    {
        "nvim-neorg/neorg",
        config = function()
            require("user.config.neorg")
        end,
        dependencies = "nvim-lua/plenary.nvim",
    },

    {
        "kosayoda/nvim-lightbulb",
        config = function()
            require("user.config.nvim-lightbulb")
        end,
        dependencies = "antoinemadec/FixCursorHold.nvim",
    },
})
