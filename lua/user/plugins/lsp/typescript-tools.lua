return {
    'pmizio/typescript-tools.nvim',
    cond = vim.env.COC ~= '1',
    lazy = false,

    dependencies = {
        {
            'sbdchd/neoformat',
            config = function()
                vim.g.neoformat_try_node_exe = 1;

                vim.api.nvim_create_autocmd('BufWritePre', {
                    pattern = { '*.ts' },
                    command = 'Neoformat',
                })
            end
        }
    },

    config = {
        settings = {
            expose_as_code_action = { 'add_missing_imports', 'organize_imports', 'fix_all' }
        }
    },

    keys = {
        {'<leader>ci', ':TSToolsAddMissingImports<CR>', silent = true, desc = 'Add missing Imports'},
        {'<leader>cI', ':TSToolsOrganizeImports<CR>', silent = true, desc = 'Organize Imports'},
    }
}
