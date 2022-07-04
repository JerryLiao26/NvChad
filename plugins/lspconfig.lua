local M = {}

M.setup_lsp = function(attach, capabilities)
    local lspconfig = require "lspconfig"

    local servers = { "html", "cssls", "jsonls", "pyright", "tsserver", "volar", "gopls" }

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = attach,
            capabilities = capabilities,
        }
    end

end

return M
