local colorscheme = "material"

if colorscheme == "material" then
    vim.g.material_style = "deep ocean"
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
