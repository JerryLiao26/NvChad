local M = {}

local lspkind = require("lspkind")

M.cmp = {
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

return M
