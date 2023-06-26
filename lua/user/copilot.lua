local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap('i', '<C-j>', '<Plug>(copilot-next)', options)
keymap('i', '<C-u>', '<Plug>(copilot-previous)', options)
