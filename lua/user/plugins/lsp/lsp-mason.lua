return {
  "williamboman/mason.nvim",
  enabled = true,
  cond = vim.env.USE_COC ~= '1',
  dependencies = {
    {"williamboman/mason-lspconfig.nvim"},
    {"WhoIsSethDaniel/mason-tool-installer.nvim"},
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'gopls',
        'jsonls',
        'dockerls',
        'html',
        'cssls',
        'html',
        'tailwindcss',
        'emmet_ls',
        'pyright',
      },

      automatic_installation = true, -- not the same as ensure_installed
    })

    require "mason-tool-installer".setup {
        ensure_installed = {
          'codelldb'
        }
    }
  end,
}
