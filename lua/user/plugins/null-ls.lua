local null_ls = require("null-ls")
local cspell = require('cspell')

-- IMPORTTANT! Requires a cspell
local sources = { cspell.diagnostics, cspell.code_actions }

null_ls.setup({
    sources = sources,
})
