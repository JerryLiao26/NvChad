local M = {}

local lspkind = require("lspkind")

M.cmp = {
    enabled = function()
        local context = require 'cmp.config.context'
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment") 
                and not context.in_syntax_group("Comment")
                and vim.bo.filetype ~= "TelescopePrompt"
                -- For NvimTree live filter
                and vim.bo.filetype ~= ""
        end
    end,
    sources = {
        { name = "cmp_tabnine" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 120,
            before = function(entry, vim_item)
                local kind = vim_item.kind
                vim_item.kind = lspkind.presets.default[vim_item.kind]
                local menu = "[" .. kind .. "]"
                if entry.source.name == "cmp_tabnine" then
                    menu = "[TabNine]"
                    if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                        menu = menu .. " " ..entry.completion_item.data.detail
                    end
                vim_item.kind = ""
                end

                vim_item.menu = menu

                return vim_item
                end,
        }),
    },
}

M.gitsigns = {
    current_line_blame = true,
    current_line_blame_formatter = "    <author>, <author_time:%Y-%m-%d> - <summary>"
}

M.nvimtree = {
    git = {
        enable = true,
    },
 
    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
}

M.treesitter = {
    ensure_installed = {
        "html",
        "css",
        "scss",
        "python",
        "javascript",
        "typescript",
        "vue",
        "go",
    }
}

M.statusline = {
    cursor_position = function()
        local sep_style = require("ui.icons").statusline_separators
        local user_sep = require("core.utils").load_config().ui.statusline.separator_style
        local sep_l = sep_style[user_sep]["left"]
        local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "
        local text = "Ln " .. vim.fn.line "." .. ", Col " .. vim.fn.col "." 

        return left_sep .. "%#St_pos_text#" .. " " .. text .. " "
    end,
}

return M
