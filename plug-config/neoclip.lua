local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

require('telescope').load_extension('neoclip')
require('neoclip').setup({ 
  preview = false,
  content_spec_column = true
})

keymap('n', '<C-c>', ':Telescope neoclip<CR>', options)

