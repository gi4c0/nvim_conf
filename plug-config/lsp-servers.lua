-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup {
  capabilities = capabilities
}
