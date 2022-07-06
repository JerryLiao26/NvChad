local M = {}

M.disabled = {
    n = {
        ["<leader>f"] = "",
    }
}

M.general = {
    n = {
        ["<leader>F"] = {
            function()
                vim.diagnostic.open_float()
            end,
            "   floating diagnostic",
        },
        ["<leader>fm"] = {
            function()
                vim.lsp.buf.formatting()
            end,
            "   general lsp formatting",
        },
    }
}

M.telescope = {
    n = {
        ["<leader>ff"] = { "<cmd> Telescope git_files <CR>", "  find git files" },
    }
}

M.bufferline = {
    n = {
        ["<TAB>"] = { "<cmd> BufferLineCycleNext <CR>", "  goto next buffer" },
        ["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <CR> ", "  goto prev buffer" },
    }
}

return M
