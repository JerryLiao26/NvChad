local M = {}

M.setup_lsp = function(attach, capabilities)
    local lspconfig = require "lspconfig"

    local servers = { "html", "cssls", "jsonls", "pyright", "tsserver", "denols", "volar", "gopls" }

    local updatedCapabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

    for _, lsp in ipairs(servers) do
        if lsp == "tsserver" then
            lspconfig["tsserver"].setup {
               on_attach = attach,
               capabilities = updatedCapabilities,
               root_dir = lspconfig.util.root_pattern("package.json"),
            } 
        elseif lsp == "denols" then
            lspconfig["denols"].setup {
               on_attach = attach,
               capabilities = updatedCapabilities,
               root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
            }
        else
            lspconfig[lsp].setup {
                on_attach = attach,
                capabilities = updatedCapabilities,
            }
        end
    end

end

return M
