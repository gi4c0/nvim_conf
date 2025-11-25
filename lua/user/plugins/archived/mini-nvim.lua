return {
    'echasnovski/mini.nvim',
    version = false,
    enabled = false,
    config = function ()
        require('mini.splitjoin').setup()
    end,
    keys = {}
}
