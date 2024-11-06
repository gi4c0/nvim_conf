return {
  "AckslD/nvim-neoclip.lua",
  lazy = false,
  dependencies = {
    {'kkharji/sqlite.lua', module = 'sqlite'},
  },
  config = function()
    require('neoclip').setup({
      enable_persistent_history = true,
      default_register = '"',
      keys = {
        telescope = {
          i = {
            select = '<cr>',
            paste = '<c-p>',
            paste_behind = '<c-y>',
            replay = '<c-q>',  -- replay a macro
            delete = '<c-d>',  -- delete an entry
            edit = '<c-e>',  -- edit an entry
            custom = {},
          },
          n = {
            select = '<cr>',
            paste = 'p',
            --- It is possible to map to more than one key.
            -- paste = { 'p', '<c-p>' },
            paste_behind = 'P',
            replay = 'q',
            delete = 'd',
            edit = 'e',
            custom = {},
          },
        },
        fzf = {
          select = 'default',
          paste = 'ctrl-p',
          paste_behind = 'ctrl-k',
          custom = {},
        },
      },
    })
  end,

  keys = {
    {'<leader>y', ':Telescope neoclip<CR>', silent = true, desc = "Yank Manager (Neoclip)" },
    -- {'<C-y>', ':Telescope neoclip<CR>', silent = true, desc = "Yank Manager (Neoclip)" }
  }
}
