local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

local whichkey_loaded, wk = pcall(require, "which-key")
if not whichkey_loaded then
    return
end

local wkopts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local ntree_loaded, neorg = pcall(require, "nvim-tree")
if ntree_loaded then
    wk.register({
        e = {"<cmd>lua require('nvim-tree.api').tree.toggle()<cr>", "Open Nvim Tree"}
    }, wkopts)
end

local neorg_loaded, neorg = pcall(require, "neorg")
if neorg_loaded then
    wk.register({
        o = {
            name = "+organization",
            s = {"<cmd>NeorgStart<cr>", "Start Neorg."},
            j = {
                name = "+journal",
                n = {"<cmd>Neorg journal today<cr>", "Journal entry for today."},
                t = {"<cmd>Neorg journal toc<cr>", "Open TOC file."},
            },
            g = {
                name = "+gtd",
                c = {"<cmd>Neorg gtd capture<cr>", "Start a new capture"},
                v = {"<cmd>Neorg gtd views<cr>", "See views"},
                e = {"<cmd>Neorg gtd edit<cr>", "Edit current task"},
            }
        }
    }, wkopts)
end

local telescope_loaded, telescope = pcall(require, "telescope")
if telescope_loaded then
    wk.register({
        f = {
            f = {"<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files"}
        }
    }, wkopts)
end
