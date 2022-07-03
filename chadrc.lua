local M = {}

local override = require "custom.override"

M.ui = {
   statusline = {
      separator_style = "arrow",
   },
}

M.plugins = {
   user = require "custom.plugins",

   override = {
      ["hrsh7th/nvim-cmp"] = override.cmp,
   },
}

return M
