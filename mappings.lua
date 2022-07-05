local M = {}

M.null_ls = {
    n = {
        ["<leader>fm"] = {
            function()
                vim.lsp.buf.formatting()
            end,
            "   lsp formatting",
        }
    }
}

M.telescope = {
    n = {
        ["<leader>ff"] = { "<cmd> Telescope git_files <CR>", "  git files" },
    }
}

return M