return {
  'pmizio/typescript-tools.nvim',
  cond = vim.env.COC ~= '1',
  lazy = false,

  dependencies = {},

  config = {
    settings = {
      -- tsserver_file_preferences = {
      --   includeInlayParameterNameHints = "all",
      --   includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --   includeInlayFunctionParameterTypeHints = true,
      --   includeInlayVariableTypeHints = true,
      --   includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      --   includeInlayPropertyDeclarationTypeHints = true,
      --   includeInlayFunctionLikeReturnTypeHints = true,
      --   includeInlayEnumMemberValueHints = true,
      -- },
      expose_as_code_action = { 'add_missing_imports', 'organize_imports', 'fix_all' },
      vtsls = {
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true, -- Should improve performance
          },
        },
      },
    }
  },

  keys = {
    {'<leader>ci', ':TSToolsAddMissingImports<CR>', silent = true, desc = 'Add missing Imports'},
    {'<leader>cI', ':TSToolsOrganizeImports<CR>', silent = true, desc = 'Organize Imports'},
  }
}
