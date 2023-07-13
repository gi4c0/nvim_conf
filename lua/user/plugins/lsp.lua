local lsp = require('lsp-zero').preset({})

lsp.ensure_installed( {
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'gopls',
  'jsonls',
  'dockerls'
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  lsp.default_keymaps({
    buffer = bufnr,
    omit = {'gD', 'gr', 'K'}
  })

  vim.keymap.set("n", "<C-j>", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<C-k>", function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set("n", "<leader>mrr", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("n", "<leader>aw", function() vim.lsp.buf.code_action() end, opts)
end)

lsp.skip_server_setup({'tsserver'}) -- We setup config separately in typescript.lua file
lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'path'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  mapping = {
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})

-- GO
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
