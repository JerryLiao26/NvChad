local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
    b.code_actions.eslint_d,
    b.formatting.prettierd,

    b.formatting.gofmt,
    b.formatting.goimports,

    b.diagnostics.flake8,
    b.formatting.autopep8,
}

null_ls.setup {
    debug = true,
    sources = sources,
}
