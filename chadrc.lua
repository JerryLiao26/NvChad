local M = {}

local override = require "custom.override"

M.ui = {
    statusline = {
        separator_style = "arrow",
        override = override.statusline,
    },

    tabufline = {
        enabled = false,
    },
}

M.options = {
    user = function()
        vim.opt.wrap = false
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
    end,
}

M.plugins = {
    user = require "custom.plugins",

    override = {
        ["hrsh7th/nvim-cmp"] = override.cmp,
        ["lewis6991/gitsigns.nvim"] = override.gitsigns,
        ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
        ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    },

    options = {
        lspconfig = {
            setup_lspconf = "custom.plugins.lspconfig",
        },
    },
}

M.mappings = require "custom.mappings"

return M
