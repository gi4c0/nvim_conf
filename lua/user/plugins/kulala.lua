return {
    'mistweaverco/kulala.nvim',
    ft = { 'http', 'rest'},
    build = 'brew install jq',
    opts = {
        global_keymaps_prefix = "<leader>k",
        global_keymaps = true
    }
}
