local last_test = ''

return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        direction = 'float',
    },
    keys = {
        {
            '<leader>tf',
            function ()
                local fname = vim.fn.expand('%:t')
                last_test = fname
                vim.cmd('TermExec cmd="yarn test ' .. fname .. '"')
            end,
            desc = "test file"
        },
        {'<leader>td', '<cmd>q!<CR>', mode = {'t', 'n'}, desc = "Terminal Delete"},
        {'<leader>tt', '<cmd>ToggleTerm<CR>', desc = "Terminal Delete", mode = {'t', 'n'}},
        {
            '<leader>tl',
            function ()
                vim.cmd('TermExec cmd="yarn test ' .. last_test .. '"')
            end,
            desc = "Last Test"
        },
    }
}
