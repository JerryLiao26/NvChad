return {
    ["tzachar/cmp-tabnine"] = {
	    run = "./install.sh",
	    after = "nvim-cmp",
	    requires = "hrsh7th/nvim-cmp",
	    config = function()
	        require "custom.plugins.tabnine"
	    end,
    },

    ["onsails/lspkind.nvim"] = {
	    requires = "hrsh7th/nvim-cmp",
    },

    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
            require "custom.plugins.null-ls"
        end,
    },
}
