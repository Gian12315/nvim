local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
end

-- Reload neovim whenever plugins.lua file is saved
vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "packer_user_config",
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = [[require('user.config.treesitter')]],
        requires = { "RRethy/nvim-treesitter-textsubjects", { "windwp/nvim-ts-autotag" } },
    })

    use({ "neovim/nvim-lspconfig", config = [[require('user.config.lsp')]] })

    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require("user.config.trouble")]],
        cmd = { "Trouble", "TroubleToggle" },
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = [[require("user.config.null-ls")]],
    })

    -- LuaSnip and nvim-cmp are to be installed together.
    use({
        "L3MON4D3/LuaSnip",
        requires = { { "rafamadriz/friendly-snippets", opt = true } },
    })

    use({
        "hrsh7th/nvim-cmp",
        config = [[require('user.config.nvim-cmp')]],
        requires = {
            { "onsails/lspkind.nvim" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-calc" },
            { "hrsh7th/cmp-path" },
            { "ray-x/cmp-treesitter", requires = "nvim-treesitter/nvim-treesitter" },
        },
    })

    use({ "windwp/nvim-autopairs", config = [[require("user.config.nvim-autopairs")]] })

    use({ "norcalli/nvim-colorizer.lua" })

    use({ "folke/which-key.nvim", config = [[require('user.config.which-key')]] })

    use({
        "nvim-telescope/telescope.nvim",
        config = [[require('user.config.telescope')]],
        requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
    })

    use({
        "lewis6991/gitsigns.nvim",
        require = { "nvim-lua/plenary.nvim" },
        config = [[require("user.config.gitsigns")]],
    })

    use({
        "numToStr/Comment.nvim",
        config = [[require('user.config.comment')]],
    })

    use({
        "kylechui/nvim-surround",
        config = [[require('user.config.nvim-surround')]],
    })

    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = [[require('user.config.lualine')]],
    })

    use({
        "kyazdani42/nvim-tree.lua",
        config = [[require('user.config.nvim-tree')]],
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    use("tpope/vim-repeat")

    use("lunarvim/darkplus.nvim")

    use("marko-cerovac/material.nvim")

    use({ "j-hui/fidget.nvim", config = [[require('user.config.fidget')]] })

    use("lewis6991/impatient.nvim")

    -- Tabbar

    use({
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require('user.config.bufferline')]],
    })
    use({ "moll/vim-bbye" })

    use({ "karb94/neoscroll.nvim", config = [[require('user.config.neoscroll')]] })

    use({ "lukas-reineke/indent-blankline.nvim", config = [[require('user.config.indent-blankline')]] })

    -- Misc
    use({ "goolord/alpha-nvim", config = [[require("user.config.alpha")]] })
    use({ "ellisonleao/carbon-now.nvim", cmd = "CarbonNow", config = [[require("user.config.carbon")]] })
    use("andweeb/presence.nvim")
    use({ "max397574/better-escape.nvim", config = [[require("user.config.better-escape")]] })
    use({ "RRethy/vim-illuminate" })

    -- DAP
    use({ "mfussenegger/nvim-dap", config = [[require("user.config.dap")]] })
    use({ "rcarriga/nvim-dap-ui", config = [[require("user.config.dap.ui")]] })

    -- Zen
    use({ "folke/twilight.nvim", config = [[require("user.config.twilight")]] })
    use({
        "Pocco81/true-zen.nvim",
        config = [[require('user.config.zen')]],
        cmd = { "TZAtaraxis", "TZMinimalist", "TZNarrow", "TZFocus" },
    })

    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })

    use({ "ggandor/leap.nvim", config = [[require("user.config.leap")]] })

    -- NeOrg
    use({
        "nvim-neorg/neorg",
        config = [[require("user.config.neorg")]],
        requires = "nvim-lua/plenary.nvim",
    })

use {
    'kosayoda/nvim-lightbulb',
        config = [[require('user.config.nvim-lightbulb')]],
    requires = 'antoinemadec/FixCursorHold.nvim',
}

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
