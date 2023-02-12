-- Require "impatient.nvim" through a safe call, does nothing if the plugin is not installed.
local impatient_loaded, _ = pcall(require, "impatient")
if impatient_loaded then
    vim.notify("STARTUP: Accelerated with impatient.nvim", vim.log.levels.INFO)
end
require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
