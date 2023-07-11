local null_ls = require("null-ls")
local cspell = require('cspell')

-- IMPORTANT! Requires a cspell

null_ls.setup({
  sources = {
    cspell.diagnostics,
    cspell.code_actions,
    null_ls.builtins.code_actions.eslint
  },
  fallback_severity = vim.diagnostic.severity.WARN
})
