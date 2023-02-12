require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "rust", "latex", "bash", "css", "java", "norg", "vim", "zig", "html" },
    highlight = { enable = true },
    incremental_selection = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },

    -- From RRethy/nvim-treesitter-textsubjects
    textsubjects = {
        enable = true,
        prev_selection = ",",
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },

    -- From windwp/nvim-ts-autotag
    autotag = {
        enable = true
    },
})
