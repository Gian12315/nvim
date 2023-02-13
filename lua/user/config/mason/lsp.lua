local servers = require('user.config.lsp.servers')

require("mason-lspconfig").setup {
    ensure_installed = servers,
}
