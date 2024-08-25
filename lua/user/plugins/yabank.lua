return {
    "ptdewey/yankbank-nvim",
    dependencies = "kkharji/sqlite.lua",
    config = function()
        require('yankbank').setup({
            persist_type = "sqlite",
            num_behavior = "jump",
        })
    end,

    keys = {
        {'<leader>y', '<cmd>YankBank<CR>', noremap = true}
    }
}
