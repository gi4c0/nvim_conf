require('telescope').load_extension('neoclip')

local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap("n", "<C-c>", ":Telescope neoclip<CR>", options)
