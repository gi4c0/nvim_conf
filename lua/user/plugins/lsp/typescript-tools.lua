return {
  'pmizio/typescript-tools.nvim',
  cond = vim.env.COC ~= '1',
  lazy = false,

  dependencies = {
    {
      'dense-analysis/ale',
      config = function()
        vim.cmd[[
          let g:ale_fixers = {
            \   'typescript': ['prettier'],
            \}
          let g:ale_linters_explicit = 1
          let g:ale_fix_on_save = 1
        ]]

        end
      }
    },

    config = {
      settings = {
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
