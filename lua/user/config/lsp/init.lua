local lspconfig = require("lspconfig")
local handlers = require("user.config.lsp.handlers")

local servers = {
    "jdtls",
    "jsonls",
    "rust_analyzer",
    "sumneko_lua",
}

local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
}

local function getDefaultConfig(lsp_name)
    local status_ok, config = pcall(require, "lspconfig.server_configurations." .. lsp_name)
    if not status_ok then
        vim.notify("LSP: Not found a server with the name: " .. lsp_name, 1)
    end
    return config
end

for _, server in ipairs(servers) do
    local default_config = getDefaultConfig(server)
    local config_found, user_config = pcall(require, "user.config.lsp.servers." .. server)
    if not config_found then
        vim.notify("LSP: User configuration for " .. server .. " not found. Using defaults. ", 1)
        user_config = {}
    end
    local config = vim.tbl_deep_extend("force", default_config, user_config, opts)
    lspconfig[server].setup(config)
end

handlers.setup()
