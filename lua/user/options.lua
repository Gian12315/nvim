local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Maybe ignore case?
-- laststatus?
-- lazy redraw?
-- matchit?
-- opt.titlestring = ''
opt.autoindent = true
opt.autoread = true
opt.background = "dark"
opt.breakindent = true
opt.completeopt = "menuone,noselect"
opt.expandtab = true
opt.foldenable = false
opt.foldclose = "all"
opt.foldmethod = "indent"
opt.hidden = true
opt.hlsearch = true
opt.incsearch = true
opt.modeline = true
opt.modelines = 5
opt.mouse = "nv"
opt.mousefocus = true
opt.number = true
opt.relativenumber = true
opt.scrolljump = 2
opt.shiftwidth = 4
opt.shortmess:append("c")
opt.showcmd = true
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.spelllang = "es,cjk"
opt.syntax = "enable"
opt.termguicolors = true
opt.title = true
opt.timeoutlen = 500
opt.undofile = true
opt.wildmenu = true

--conceal cursor and level?
-- gui cursor

--vim.api.nvim_create_autocmd({ 'VimEnter' }, {
--pattern = { '*' },
--callback = function()
--vim.cmd('colorscheme mountain')
--end,
--})
-- cmd("autocmd VimEnter * colorscheme mountain")

-- vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
-- pattern = { 'plugins.lua' },
-- callback = function()
-- vim.cmd('PackerCompile')
-- end,
-- })
-- cmd("autocmd BufWritePost plugins.lua PackerCompile")
